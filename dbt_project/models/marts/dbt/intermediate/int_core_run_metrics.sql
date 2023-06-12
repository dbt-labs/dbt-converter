with 
  
invocations as (
  
    select * from {{ ref('fct_dbt_invocations') }}
    where distribution = 'core'
    and command in ('build','run')
  
),

core_runs as (

    select
        invocation_id,
        adapter_unique_id,
        inferred_project_id,
        started_at::date as date_day,
        started_at,
        ended_at,
        datediff(
            second,
            started_at,
            ended_at
        ) as duration_in_sec,
    
        case
            when duration_in_sec <= 60
                then '0-60 seconds'
            when duration_in_sec > 60
                and duration_in_sec <= 120
                then '60-120 seconds'
            when duration_in_sec > 120
                and duration_in_sec <= 240
                then '120-240 seconds'
            when duration_in_sec > 240
                and duration_in_sec <= 360
                then '240-360 seconds'
            when duration_in_sec > 360
                and duration_in_sec <= 720
                then '360-720 seconds'
            when duration_in_sec > 720
                and duration_in_sec <= 1200
                then '720-1200 seconds'
            when duration_in_sec > 1200
                then '1200+ seconds'
        end as duration_tier,
        end_state,
        case
            when end_state = 'error'
                then 1
            else 0
        end as is_failed_run,

        case
            when end_state = 'ok'
                then 1
            else 0
        end as is_successful_run,
        
        complexity,
        count_models,
        count_changed,
        count_succeed,
        count_seeds,
        count_error,
        dbt_version,
        adapter,
        'core_run' as type
    from invocations

),

ranked as (

    select
        *,

        row_number() over(
            partition by inferred_project_id
            order by coalesce(ended_at,started_at) desc
        ) as run_rank

    from core_runs

),

final as (

    select
        {{ dbt_utils.generate_surrogate_key([
          'inferred_project_id',
          'run_rank'
        ]) }} as project_rank_id_sk,
        *

    from ranked

)

select * from final