

with

cloud_accounts as (

    select * from analytics_dev.dbt_jstein.stg_cloud__accounts

),

primary_mappings as (

    select * from analytics_dev.dbt_jstein.int_cloud_account_mappings__primaries

),

quickbooks as (

    select * from analytics_dev.dbt_jstein.stg_quickbooks__account_id_map

),

account_snapshots as (

    select * from analytics_dev.dbt_jstein.stg_cloud__accounts_snapshot_daily

),

stripe_invoices as (

    select * from analytics_dev.dbt_jstein.stg_cloud_stripe__invoices

),

stripe_customers as (

    select * from analytics_dev.dbt_jstein.stg_cloud_stripe__customers

),

self_service_upgrades as (

--for self-service upgrades, we want to prioritize the stripe_customer_id as their customer_id
--This CTE filters for users who upgraded from Team to Enterprise.
--NOTE: this is temporary until we bring all self-service customers into Salesforce
    select distinct
        account_id,
        lag(plan) over (
            partition by account_id
            order by date_day
        ) as previous_plan,
        true as is_self_service_upgrade

    from account_snapshots
    qualify previous_plan ilike 'team%'
    and plan ilike 'enterprise%'

),

first_developer as (

    -- This is the most ideal place to put this logic today, but it's not
    -- the best place. We're choosing to use this as the place for the logic to
    -- reside in the meantime to prevent futher bloating fct_cloud_accounts. We
    -- plan to refactor this in the future but this works well in the meantime.
    -- note by Andrew Escay May 17, 2022
    select
        account_id,
        min(date_day) as first_developer_plan_at
    from account_snapshots
    where plan ilike 'developer%'
    group by 1

),

team_paying as (

    select
        stripe_customer_id,
        min(invoice_date::date) as first_paid_team_at
    from stripe_invoices
    where is_paid_invoice
        and not is_full_refund
    group by 1

),

joined as (

    select
        cloud_accounts.*,

        primary_mappings.salesforce_account_id,
        primary_mappings.sfdc_parent_account_id,
        primary_mappings.organization_id,
        primary_mappings.is_primary,

        case
            when team_paying.first_paid_team_at is not null
            or primary_mappings.account_status in ('Customer', 'Churned Customer')
                then true
            else false
        end as is_paying_account,

        coalesce(
            self_service_upgrades.is_self_service_upgrade,
            false
        ) as is_self_service_upgrade,

        first_developer.first_developer_plan_at,
        team_paying.first_paid_team_at,

        case
            when plan ilike 'enterprise%'
                and salesforce_account_id is not null
                then 'salesforce_account_id'
            when stripe_customer_id is not null
                then 'stripe_customer_id'
        end as customer_id_type,

        case
            when customer_id_type = 'salesforce_account_id'
                then salesforce_account_id
            when customer_id_type = 'stripe_customer_id'
                then stripe_customer_id
        end as customer_id,

        case
            when customer_id_type = 'salesforce_account_id'
                then primary_mappings.salesforce_account_name
            when customer_id_type = 'stripe_customer_id'
                then stripe_customers.stripe_customer_name
        end as customer_name,

            --A billing account is a discrete method by which a customer is
            --paying for a cloud account. This facilitates aggregation to the 
            --customer, organization, and persons grains
            -- See more: https://www.notion.so/dbtlabs/Billing-Accounts-b0c33a62f6ed4638aeaf2baeed982282
        
    
md5(cast(coalesce(cast(customer_id as TEXT), '') || '-' || coalesce(cast(cloud_account_id as TEXT), '') as TEXT)) as billing_account_id

    from cloud_accounts
    left join self_service_upgrades using (account_id)
    left join first_developer using (account_id)
    left join primary_mappings
        on cloud_accounts.account_id = primary_mappings.cloud_account_id
    left join team_paying using (stripe_customer_id)
    left join stripe_customers using (stripe_customer_id)

),

slimmed_and_flags as (

    select
        account_id,
        tenant_account_id,
        organization_id,
        salesforce_account_id,
        sfdc_parent_account_id,
        quickbooks.quickbooks_customer_id,
        stripe_customer_id,
        billing_account_id,

        customer_id,
        customer_id_type,
        customer_name,

        database_source,
        database_schema,
        database_type,

        name as cloud_account_name,
        plan,
        plan_tier,
        
        first_developer_plan_at,
        first_paid_team_at,

        is_self_service_upgrade,
        is_account_deleted,

        case
            when salesforce_account_id is null
                    then true
            else coalesce(is_primary, false)
         end as is_primary_cloud_account,
            --1. There are some Cloud Accounts that do not have an
            --   an existing Salesforce Account. This can happen if
            --   the Cloud Account uses a personal email (gmail/outlook/etc)
            --   or if there are no Salesforce Accounts with that existing
            --   email domain. For those personal accounts without a Salesforce
            --   Account, then mark them as true.
            --2. Else, use the `is_primary` logic or mark it as false 


    --this ensures we're flagging the correct paid accounts based on their
    --salesforce account, stripe payment history, and removing POVs 
        case
            when is_paying_account
                and first_paid_team_at is not null
                    then true
            when is_paying_account
                and plan ilike 'enterprise%'
                and not is_locked
                and not is_partner_training_acct
                and not is_account_deleted
                and (
                    (database_type = 'multi-tenant' and is_primary_cloud_account)
                    or (database_type = 'single-tenant' and not is_test_account)
                    --to remove the dbt Support accts
                ) then true
            else false
        end as is_paying_account

    from joined
    left join quickbooks using (salesforce_account_id)
        --We used Quickbooks for invoicing until Sept 2021
        --Because of this, we want to include the Quickbooks Customer ID
        --in case we need to refer to historical invoices

)

select * from slimmed_and_flags