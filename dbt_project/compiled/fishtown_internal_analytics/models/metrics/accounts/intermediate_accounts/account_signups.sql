with

account_signups as (

    select * from analytics_dev.dbt_jstein.fct_cloud_accounts
    where is_test_account = false
        and is_partner_training_acct = false

),

salesforce_accounts as (

    select * from analytics_dev.dbt_jstein.dim_salesforce_accounts

),

joined as (

    select
        account_signups.* exclude (sign_up_source),
        coalesce(account_signups.sign_up_source, 'House Cloud direct') as sign_up_source,
        salesforce_accounts.billing_region_category as region_category,
        salesforce_accounts.employee_count_range

    from account_signups
    left join salesforce_accounts
        on account_signups.salesforce_account_id = salesforce_accounts.account_id

)

select * from joined