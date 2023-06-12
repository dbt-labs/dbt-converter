with

activated_accounts as (

    select * from {{ ref('fct_cloud_accounts') }}
    where is_internal_account = false
        and is_partner_training_acct = false
        and first_successful_run_at::date <= dateadd('day', 14, created_at::date)

),

account_snapshots as (

    select * from {{ ref('stg_cloud__accounts_snapshot_daily') }}

),

subscription_transactions as (

    select * from {{ ref('fct_cloud_subscription_transactions') }}

),

salesforce_accounts as (

    select * from {{ ref('dim_salesforce_accounts') }}

),

account_team_conversions as (

    select
        account_id,
        min(date_day::date) as first_plan_at

    from account_snapshots  
    where plan ilike any ('developer%','team%','enterprise%')
    group by 1

), 

first_team_subscription_filtered as (

    select
        account_team_conversions.*,
        subscription_transactions.sales_motion

    from account_team_conversions
    left join subscription_transactions
        on account_team_conversions.account_id = subscription_transactions.cloud_account_id
        and account_team_conversions.first_plan_at = subscription_transactions.date_day
    
),

joined as (

    select
        activated_accounts.* exclude (sign_up_source, last_touch_conversion_channel, last_touch_conversion_campaign),
        coalesce(activated_accounts.sign_up_source, 'House Cloud direct') as sign_up_source,
        coalesce(activated_accounts.last_touch_conversion_channel, 'No Channel') as channel,
        coalesce(activated_accounts.last_touch_conversion_campaign, 'No Marketing Campaign') as marketing_campaign,
        coalesce(salesforce_accounts.billing_region_category, 'No Region Category') as region_category,
        coalesce(salesforce_accounts.employee_count_range, 'No Employee Count Range') as employee_count_range,
        coalesce(salesforce_accounts.market_segment, 'No Market Segment') as market_segment,
        first_team_subscription_filtered.first_plan_at,
        first_team_subscription_filtered.sales_motion,
        first_team_subscription_filtered.first_plan_at is not null and datediff('day', activated_accounts.created_at::date, first_team_subscription_filtered.first_plan_at) <= 30 as is_converted

    from activated_accounts
    left join first_team_subscription_filtered
        on activated_accounts.account_id = first_team_subscription_filtered.account_id
    left join salesforce_accounts
        on activated_accounts.salesforce_account_id = salesforce_accounts.account_id

)

select * from joined