with 

account_activated as (

    select *
    from analytics_dev.dbt_jstein.fct_cloud_accounts 
    where is_test_account = false
        and is_partner_training_acct = false
        and first_successful_run_at::date <= dateadd(day,14,created_at::date)

),

account_conversions as (

    select
        account_id,
        min(date_day::date) as first_plan_at
    from analytics_dev.dbt_jstein.stg_cloud__accounts_snapshot_daily  
    where plan ilike any ('developer%', 'team%', 'enterprise%')
    group by 1
), 

sales_motion as (

SELECT a.*, b.sales_motion
FROM account_conversions a
LEFT JOIN analytics_dev.dbt_jstein.fct_cloud_subscription_transactions b
    ON a.account_id = b.cloud_account_id
    and a.first_plan_at = b.date_day
    ),

salesforce_accounts as (

    select * from analytics_dev.dbt_jstein.dim_salesforce_accounts

),

joined as (

SELECT a.* exclude (sign_up_source),
       coalesce(a.sign_up_source, 'House Cloud direct') as sign_up_source,
       s.billing_region_category as region_category,
       s.employee_count_range,
       c.first_plan_at,
       c.sales_motion,
       --CASE WHEN c.first_plan_at is not null and datediff('day', a.created_at, c.first_plan_at) <= 14 THEN 'is_converted_14_days' ELSE NULL END AS converted_accounts_14d,
       --CASE WHEN c.first_plan_at is not null and datediff('day', a.created_at::date, c.first_plan_at) <= 30 THEN true ELSE false END AS is_converted
       c.first_plan_at is not null and datediff('day', a.created_at::date, c.first_plan_at) <= 30 as is_converted
FROM account_activated a
LEFT JOIN sales_motion c
    ON a.account_id = c.account_id
LEFT JOIN salesforce_accounts s
    ON a.salesforce_account_id = s.account_id
    )

SELECT * FROM joined