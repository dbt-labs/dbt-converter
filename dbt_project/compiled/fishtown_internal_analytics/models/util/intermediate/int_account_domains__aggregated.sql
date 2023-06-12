with

salesforce_accounts as (

    select * from analytics_dev.dbt_jstein.stg_salesforce__accounts
    where is_deleted = false

),

domains as (

    select * from analytics_dev.dbt_jstein.stg_salesforce__domains
    where is_deleted = false

),

salesforce_cloud_account_mappings as (

    select * from analytics_dev.dbt_jstein.stg_salesforce__cloud_account_mappings
    where is_deleted = false
        and is_account_override = true

),

cloud_user_account_mappings as (

    select * from analytics_dev.dbt_jstein.stg_cloud__user_licenses
    where is_user_license_deleted = 0

),

cloud_accounts as (

    select
        *,
        split_part(billing_email_address,'@',-1) as billing_email_domain
         
    from analytics_dev.dbt_jstein.stg_cloud__accounts

),

cloud_users as (

    select
        *,
        split_part(email,'@',-1) as email_domain
    
     from analytics_dev.dbt_jstein.stg_cloud__users

),

user_accounts_joined as (

    select
        cloud_user_account_mappings.*,

        -- there are several emails coming through as '' instead of null, especially with single tenants
        -- this is to remedy that
        case
            when cloud_users.email_domain = '' then null
            else cloud_users.email_domain
        end as email_domain
    
    from cloud_user_account_mappings
    left join cloud_users
        on cloud_user_account_mappings.user_id = cloud_users.user_id

),

salesforce_domain_accounts_joined as (

    select
        domains.*,
        salesforce_accounts.account_name as salesforce_account_name,
        salesforce_accounts.account_id as salesforce_account_id,
        salesforce_accounts.account_status as salesforce_account_status,
        salesforce_accounts.account_status in ('Customer','Churned Customer') as is_managed_customer,
        salesforce_accounts.number_of_all_partnerships > 0 as is_partner_domain,
        salesforce_accounts.account_id in ('0016g00000EFCncAAH','0014v00002OxoX7AAJ','0014v00002Id1ZEAAZ') as is_internal_domain

    from domains
    left join salesforce_accounts
        on domains.account_id = salesforce_accounts.account_id

),

account_domains_aggregated as (

    select
        account_id,
        email_domain,
        min(created_at) as first_license_created_at,
        max(created_at) as last_license_created_at,
        count(*) as count_of_users

    from user_accounts_joined
    group by 1,2

),

cloud_account_domains_joined as (

    select
        account_domains_aggregated.account_id,
        account_domains_aggregated.email_domain,
        account_domains_aggregated.count_of_users,
        account_domains_aggregated.first_license_created_at,
        account_domains_aggregated.last_license_created_at,
        cloud_accounts.database_type,
        cloud_accounts.database_source,
        cloud_accounts.name as cloud_account_name,
        cloud_accounts.billing_email_domain,
        cloud_accounts.plan_tier as cloud_account_plan_tier,
        salesforce_domain_accounts_joined.salesforce_account_id,
        salesforce_domain_accounts_joined.salesforce_account_name,
        salesforce_domain_accounts_joined.salesforce_account_status,
        salesforce_cloud_account_mappings.account_id as override_sfdc_account_id,
        override_salesforce_accounts.account_name as override_sfdc_account_name,
        cloud_accounts.is_partner_training_acct,
        salesforce_domain_accounts_joined.is_managed_customer,
        coalesce(salesforce_cloud_account_mappings.is_account_override,false) as is_account_override,
        coalesce(account_domains_aggregated.email_domain = cloud_accounts.billing_email_domain,false) as is_billing_domain,
        coalesce(salesforce_domain_accounts_joined.is_internal_domain,false) as is_internal_domain,
        coalesce(salesforce_domain_accounts_joined.is_partner_domain,false) as is_partner_domain,
        coalesce(salesforce_domain_accounts_joined.is_consumer_domain,false) as is_consumer_domain
    
    from account_domains_aggregated
    left join salesforce_domain_accounts_joined
        on account_domains_aggregated.email_domain = salesforce_domain_accounts_joined.domain_name
    inner join cloud_accounts
        on account_domains_aggregated.account_id = cloud_accounts.account_id
    left join salesforce_cloud_account_mappings
        on account_domains_aggregated.account_id = salesforce_cloud_account_mappings.cloud_account_id
    left join salesforce_accounts override_salesforce_accounts
        on salesforce_cloud_account_mappings.account_id = override_salesforce_accounts.account_id

),

business_domains as (

    select
        *,
        case
            when coalesce(is_internal_domain,false) = false
                and coalesce(is_partner_domain,false) = false
                and coalesce(is_consumer_domain,false) = false
                and email_domain != ''
            then true
            else false
        end as is_business_domain

    from cloud_account_domains_joined

),

calcs as (

    select
        *,
        
        coalesce(case
            when is_internal_domain then count_of_users
        end,0) as count_of_internal_domain_users,

        coalesce(case
            when is_partner_domain then count_of_users
        end,0) as count_of_partner_domain_users,

        coalesce(case
            when is_consumer_domain then count_of_users
        end,0) as count_of_consumer_domain_users,

        coalesce(case
            when is_business_domain then count_of_users
        end,0) as count_of_business_domain_users

    from business_domains

),

aggregated as (

    select
        *,
        coalesce(max(is_managed_customer) over (partition by account_id),false) as account_level_is_managed_customer,
        coalesce(max(is_billing_domain) over (partition by account_id),false) as account_level_billing_domain_match,
        sum(count_of_internal_domain_users) over (partition by account_id) as account_level_internal_domain_users,
        sum(count_of_partner_domain_users) over (partition by account_id) as account_level_partner_domain_users,
        sum(count_of_consumer_domain_users) over (partition by account_id) as account_level_consumer_domain_users,
        sum(count_of_business_domain_users) over (partition by account_id) as account_level_business_domain_users
    
    from calcs

),

final as (

    select
        
    
md5(cast(coalesce(cast(account_id as TEXT), '') || '-' || coalesce(cast(email_domain as TEXT), '') as TEXT)) as account_domain_id,
        *

    from aggregated

)

select * from final