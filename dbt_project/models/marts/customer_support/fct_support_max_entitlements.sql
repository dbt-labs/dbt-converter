{{
    config(
        materialized = 'incremental',
        unique_key = 'id',
        snowflake_warehouse = set_warehouse_config('large')
    )
}}


with plans as (
    
    select *
    from {{ ref('stg_cloud__accounts_snapshot_daily') }}

),

users as (
    select * 
    from {{ ref('stg_cloud__user_licenses_snapshot_daily') }}
),

joined as (
    select 
        replace(users.email,'fishtownanalytics.com','dbtlabs.com') as email,
        users.date_day, 
        plans.account_id,
        case 
            -- some partner accounts use enterprise to get access to things like SSO for testing
            -- this will exclude those partners from being marked as enterprise-entitled for support SLAs
            when plans.plan_tier ilike 'enterprise' and not plans.is_locked and not name ilike '%(partner)%' then '01-enterprise' 

            when plans.plan_tier ilike 'team' and not plans.is_locked then '02-team'
            when plans.plan_tier ilike 'trial' and not plans.is_locked then '03-trial'
            when plans.plan_tier ilike 'developer' and not plans.is_locked then '04-developer'
            when plans.plan_tier ilike 'free' and not plans.is_locked then '05-free'

            -- some partner accounts use enterprise to get access to things like SSO for testing
            -- mark them the same as being on the free tier
            when plans.plan_tier ilike 'enterprise' and not plans.is_locked and name ilike '%(partner)%' then '05-free' 

            -- some partner accounts use enterprise to get access to things like SSO for testing
            -- this will exclude those partners from being marked as enterprise-entitled for support SLAs
            when plans.plan_tier ilike 'enterprise' and plans.is_locked and not name ilike '%(partner)%' then '06-locked-enterprise'

            when plans.plan_tier ilike 'team' and plans.is_locked then '07-locked-team'
            when plans.plan_tier ilike 'trial' and plans.is_locked then '08-locked-trial'
            when plans.plan_tier ilike 'developer' and plans.is_locked then '09-locked-developer'
            when plans.plan_tier ilike 'free' and plans.is_locked then '10-locked-free'

            -- some partner accounts use enterprise to get access to things like SSO for testing
            -- mark them the same as being on the free tier
            when plans.plan_tier ilike 'enterprise' and not plans.is_locked and name ilike '%(partner)%' then '10-locked-free'

            -- catch-all category for things like cancelled accounts
            else '11' || '-' || plans.plan_tier 
        end as priority_order
    from users

    inner join users as users_historical
        on users.email = users_historical.email
        -- look 3 days before and after the account status changes
        and datediff(day,users_historical.date_day,users.date_day) between -3 and 3
        and users_historical.is_user_license_deleted = 0
    
    inner join plans
        on users_historical.account_id = plans.account_id
        and users_historical.date_day = plans.date_day
        and is_account_feature_flag_deleted = 0

    {% if is_incremental() %}
        where users_historical.date_day >= (
            select dateadd(day, -3, max(date_day)::date) from {{this}}
        )
    {% endif %}

),

final as (
    select 
        email,
        date_day,
        count(distinct account_id) as active_accounts, 
        right(min(priority_order),len(min(priority_order))-3) as top_plan,
        array_agg(distinct priority_order) within group (order by priority_order) as unique_plan_tiers,
        array_agg(distinct account_id) within group (order by account_id) as active_account_list 
    from joined 
    group by 1, 2
    having active_accounts > 0

    UNION ALL

    select 
        replace(email,'dbtlabs.com','fishtownanalytics.com') as email,
        date_day,
        count(distinct account_id) as active_accounts, 
        right(min(priority_order),len(min(priority_order))-3) as top_plan,
        array_agg(distinct priority_order) within group (order by priority_order) as unique_plan_tiers,
        array_agg(distinct account_id) within group (order by account_id) as active_account_list 
    from joined 
    where email ilike '%dbtlabs.com'
    group by 1, 2
    having active_accounts > 0
)

select 
  *,
  {{ dbt_utils.generate_surrogate_key(['email', 'date_day']) }} as id
from final

