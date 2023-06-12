with

subscription_transactions as (

    select * from {{ ref('fct_cloud_subscription_transactions') }}
    where change_category = 'new'
        and sales_motion = 'Self-Service'

),

accounts_snapshot as (

    select * from {{ ref('stg_cloud__accounts_snapshot_daily') }}

),

accounts as (

    select * from {{ ref('fct_cloud_accounts') }}

),

salesforce_accounts as (

    select * from {{ ref('dim_salesforce_accounts') }}

),

joined as (
    
    select
        subscription_transactions.cloud_account_id,
        subscription_transactions.salesforce_account_id,
        subscription_transactions.date_day,
        subscription_transactions.sales_motion,
        accounts_snapshot.plan_tier,
        
        -- cleanup so metrics work with Null values
        coalesce(accounts.sign_up_source, 'House Cloud direct') as sign_up_source,
        coalesce(accounts.last_touch_conversion_channel, 'No Channel') as channel,
        coalesce(accounts.last_touch_conversion_campaign, 'No Marketing Campaign') as marketing_campaign,
        coalesce(salesforce_accounts.billing_region_category, 'No Region Category') as region_category,
        coalesce(salesforce_accounts.employee_count_range, 'No Employee Count Range') as employee_count_range,
        coalesce(salesforce_accounts.market_segment, 'No Market Segment') as market_segment,

        sum(subscription_transactions.arr_change) as net_new_arr

    from subscription_transactions
    left join accounts
        on subscription_transactions.cloud_account_id = accounts.account_id
    left join accounts_snapshot
        on subscription_transactions.cloud_account_id = accounts_snapshot.account_id
        and subscription_transactions.date_day = accounts_snapshot.date_day
    left join salesforce_accounts
        on subscription_transactions.salesforce_account_id = salesforce_accounts.account_id
    {{ dbt_utils.group_by(n=11) }}

)

select * from joined