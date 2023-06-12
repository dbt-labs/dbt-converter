with accounts as (
SELECT a.cloud_account_id,
       a.salesforce_account_id,
       a.date_day,
       a.sales_motion,
       b.sign_up_source,
       p.plan_tier,
       sum(a.arr_change) as net_new_arr
FROM analytics_dev.dbt_jstein.fct_cloud_subscription_transactions a
LEFT JOIN analytics_dev.dbt_jstein.stg_cloud__accounts_snapshot_daily p
    ON a.cloud_account_id = p.account_id
    and a.date_day = p.date_day
LEFT JOIN analytics_dev.dbt_jstein.fct_cloud_accounts b
    ON a.cloud_account_id = b.account_id
where change_category = 'new'
    AND sales_motion = 'Self-Service'
GROUP BY 1,2,3,4,5,6
),

salesforce_accounts as (

    select * 
    from analytics_dev.dbt_jstein.dim_salesforce_accounts

),

joined as (

    select
        accounts.* exclude (sign_up_source),
        coalesce(sign_up_source, 'House Cloud direct') as sign_up_source,
        salesforce_accounts.billing_region_category as region_category,
        salesforce_accounts.employee_count_range

    from accounts
    left join salesforce_accounts
        on accounts.salesforce_account_id = salesforce_accounts.account_id

)

SELECT * FROM joined