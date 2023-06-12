with

accounts_snapshot_daily as (

    select * from {{ ref('stg_cloud__accounts_snapshot_daily') }}
    {% if is_incremental() %}
        where date_day > (select dateadd(day, -1, max(start_date)) from {{ this }})
    {% endif %}

),

plan_changes as (

    select
        *,
        lag(plan) over (partition by account_id order by date_day) as previous_plan,
        lag(plan_tier) over (partition by account_id order by date_day) as previous_plan_tier
    from accounts_snapshot_daily 
    qualify plan != previous_plan or previous_plan is null
  
),

final as (

    select
        {{dbt_utils.generate_surrogate_key([
            'account_id',
            'date_day'
        ])}} as account_plan_history_id,
        account_id,
        plan,
        plan_tier,
        date_day as start_date,
        coalesce(
            lead(date_day) over (
                partition by account_id 
                order by date_day
            ),
            dateadd('year', 1, current_date)
        ) as end_date

    from plan_changes  
  
)

select * from final