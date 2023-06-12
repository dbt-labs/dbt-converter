
  create or replace   view analytics_dev.dbt_jstein.int_cloud__account_plan_history
  
   as (
    with

accounts_snapshot_daily as (

    select * from analytics_dev.dbt_jstein.stg_cloud__accounts_snapshot_daily
    

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
        
    
md5(cast(coalesce(cast(account_id as TEXT), '') || '-' || coalesce(cast(date_day as TEXT), '') as TEXT)) as account_plan_history_id,
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
  );

