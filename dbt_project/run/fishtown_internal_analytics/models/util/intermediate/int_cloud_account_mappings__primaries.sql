
  
    

        create or replace transient table analytics_dev.dbt_jstein.int_cloud_account_mappings__primaries  as
        (

with

cloud_accts as (

    select * from analytics_dev.dbt_jstein.stg_cloud__accounts

),

mappings as (

    select * from analytics_dev.dbt_jstein.int_cloud_account_mappings__stepped

),

salesforce_accounts as (

    select * from analytics_dev.dbt_jstein.stg_salesforce__accounts

),

mappings_enriched as (

    select

        cloud_accts.account_id as cloud_account_id,

        

        mappings.salesforce_account_id,

        mappings.salesforce_account_name,

        coalesce(
            salesforce_accounts.parent_id,
            mappings.salesforce_account_id
        ) as sfdc_parent_account_id,
        --we do a coalesce here bc parent accounts will not have a parent_account_id
        --but we want to keep them consolidated under one organization

        coalesce(
            mappings.salesforce_account_id,
            cloud_accts.stripe_customer_id
        ) as organization_id,
        --NOTE FOR ORG ENTITY 
            --[August 2022] We used to use the sfdc_parent_account_id for single-tenant
            --accounts (e.g. USAA -> USAA-BANK, USAA-PNC, etc) but these are now
            --consolidated.
            --However, accounts such as CISCO, Cisco Meraki, etc have their own contracts
            --despite being under a single organiszation. So we can safely assume that
            --one salesforce account that is a customer = one contract = one org
            --But Cisco will be the sfdc_parent_account_id

        salesforce_accounts.account_status,

        salesforce_accounts.deployment_type,

        salesforce_accounts.created_at as sfdc_account_created_at,

        salesforce_accounts.is_internal_account,

        cloud_accts.name as cloud_account_name,
        cloud_accts.database_type,
        cloud_accts.database_source,

        cloud_accts.plan as cloud_account_plan,
        cloud_accts.plan_tier as cloud_account_plan_tier,

        cloud_accts.is_partner_training_acct,
        cloud_accts.is_account_deleted,
        cloud_accts.is_locked,
        cloud_accts.read_only_seats + cloud_accts.developer_seats as total_seats,
        cloud_accts.created_at as cloud_account_created_at,
        cloud_accts.updated_at as cloud_account_last_updated_at

    from cloud_accts
    --we base this off of cloud_accounts so we can bring in
    --Cloud Accounts that are not included in the Salesforce Acconut Mappings object
    left join mappings
        on cloud_accts.account_id = mappings.account_id 
    left join salesforce_accounts
        on mappings.salesforce_account_id = salesforce_accounts.account_id

),

slimmed as (

    select
        *,
        cloud_account_plan_tier in ('free', 'trial', 'developer') as is_free_tier,

        count(cloud_account_id) over (
            partition by organization_id
        ) as total_cloud_accounts,

        count(case when cloud_account_plan_tier = 'team' then cloud_account_id end) over (
            partition by organization_id
        ) as total_cloud_accounts__team,

        count(case when cloud_account_plan_tier = 'enterprise' then cloud_account_id end) over (
            partition by organization_id
        ) as total_cloud_accounts__enterprise,

        count(case when cloud_account_plan_tier = 'enterprise' and account_status = 'Customer' then cloud_account_id end) over (
            partition by organization_id
        ) as total_cloud_accounts__enterprise_paying,

        row_number() over (
            partition by organization_id, cloud_account_plan_tier
            order by total_seats desc, cloud_account_last_updated_at desc
        ) as cloud_seats_index,

        row_number() over (
            partition by organization_id, is_free_tier
            order by total_seats desc, cloud_account_last_updated_at desc
        ) as tiers_updated_at_index

    from mappings_enriched
    where not is_partner_training_acct
    and not is_account_deleted
    and not is_locked
    and cloud_account_plan_tier != 'cancelled'
    and not cloud_account_name ilike any ('%dbt support%','%dbt labs support%')
    --do not include partner training accounts
    --or deleted/testing accounts in this mapping
    --or locked trial accounts
    --or cancelled accounts

),

fixed as (

    select

        *,

        case
            when cloud_account_plan_tier != 'enterprise'
            and total_cloud_accounts = 1
                then true

        --accounts that have one enterprise account
            when cloud_account_plan_tier = 'enterprise'
            and account_status ilike any ('%customer%','%prospect%', '%inactive%')
            and total_cloud_accounts__enterprise = 1
                then true

        --accounts that have multiple enterprise cloud accounts
            when cloud_account_plan_tier = 'enterprise'
            and account_status ilike any ('%customer%','%prospect%', '%inactive%')
            and total_cloud_accounts__enterprise > 1
            and cloud_seats_index = 1
                then true

        --accounts that have one team account
            when cloud_account_plan_tier = 'team'
            and total_cloud_accounts__enterprise = 0
            and total_cloud_accounts__team = 1
                then true 

        --accounts that have multiple team accounts
        --choose the account with the most seats    
        --NOTE: maybe choose the account that's most advanced?
            when cloud_account_plan_tier = 'team'
            and total_cloud_accounts__enterprise = 0
            and total_cloud_accounts__team > 1
            and cloud_seats_index = 1
                then true 

        --accounts that have an enterprise account but aren't yet a customer
        --choose the account with the most seats
            when cloud_account_plan_tier = 'team'
            and not account_status ilike any ('%customer%','%prospect%', '%inactive%')
            and total_cloud_accounts__enterprise > 0
            and total_cloud_accounts__enterprise_paying = 0
            and tiers_updated_at_index = 1
                then true

        --accounts that are in the free tier and have an enterprise trial
        --choose the account that was last updated
            when cloud_account_plan_tier in ('free', 'trial', 'developer')
            and not account_status ilike any ('%customer%','%prospect%','%inactive%')
            and total_cloud_accounts__enterprise > 0
            and total_cloud_accounts__team = 0
            and tiers_updated_at_index = 1
                then true 

        --accounts that have multiple free-tier accounts
        --choose the account that was last updated 
            when cloud_account_plan_tier in ('free', 'trial', 'developer')
            and total_cloud_accounts__enterprise = 0
            and total_cloud_accounts__team = 0
            and tiers_updated_at_index = 1
                then true

        --do not include Fishtown Analytics or dbt Labs
            when is_internal_account
                then false
            else false
        end as is_primary

    from slimmed

),

inactive_accounts as (
    --If a Salesforce Account only has inactive Cloud Accounts
    --then we should mark one of these Cloud Accounts as the
    --primary Cloud Account.
    --The logic here is that, if Salesforce Account (i.e. a company)
    --has ever had a Cloud Account, we'd want to still see what
    --their activity was in Cloud.
    --This is especially important
    --for Sales Reps if a company comes back and wants to start
    --a conversation to try Cloud again.

    select
        *,
        case
            when is_locked then cloud_account_id
            when is_account_deleted = 1 then cloud_account_id
            when cloud_account_plan_tier = 'cancelled' then cloud_account_id
            when is_partner_training_acct then cloud_account_id
        end as stray_cloud_account_id,

        count(cloud_account_id) over (
            partition by organization_id
        ) as total_cloud_accounts,

        count(stray_cloud_account_id) over (
            partition by organization_id
        ) as total_stray_cloud_accounts,

         total_cloud_accounts = total_stray_cloud_accounts as is_inactive_account
    
    from mappings_enriched

),

final as (

    select
        mappings_enriched.*,

        case
            --for accounts that only have a partner account
            when is_partner_training_acct
                and count(cloud_account_id) over (
                        partition by organization_id) = 1
                    then true

            -- for accounts that only have locked, deleted, canceled, or multiple partner accounts
            when inactive_accounts.is_inactive_account
                and row_number() over (
                        partition by organization_id
                        order by cloud_account_last_updated_at desc) = 1
                    then true

            -- for accounts that don't have a SFDC parent, default to true
            when organization_id is null
                then true
            
            else coalesce(fixed.is_primary, false)
        end as is_primary

    from mappings_enriched
    left join fixed using (cloud_account_id)
    left join inactive_accounts using (cloud_account_id)

)

select * from final
        );
      
  