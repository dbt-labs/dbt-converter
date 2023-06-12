with

account_activated as (

    select * 
    from analytics_dev.dbt_jstein.fct_cloud_accounts
    where is_test_account = false
        and is_partner_training_acct = false
        and first_successful_run_at::date <= dateadd(day,14,created_at::date)

),

salesforce_accounts as (

    select * from analytics_dev.dbt_jstein.dim_salesforce_accounts

),

joined as (

    select
        account_activated.* exclude (sign_up_source),
        coalesce(account_activated.sign_up_source, 'House Cloud direct') as sign_up_source,
        salesforce_accounts.billing_region_category as region_category,
        salesforce_accounts.employee_count_range

    from account_activated
    left join salesforce_accounts
        on account_activated.salesforce_account_id = salesforce_accounts.account_id

)

select * FROM joined