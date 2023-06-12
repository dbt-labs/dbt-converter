{{
  config(
    materialized = "view"
  )
}}

with

legacy_startup_events as (

    select
        *,
        first_value(start_type) ignore nulls over (
          partition by active_session_id
          order by event_at
        ) as first_start_type
    from {{ ref('int__cloud_ide_active_session_events') }}

),

startup_events as (

    select * from {{ ref('stg_dbt_cloud__ide_refresh_lifecycle') }}

),

legacy_startup_sessions as (


    select
        active_session_id as startup_id,
        '1.0' as ide_version,
        first_start_type as start_type,
        backfilled_develop_request_id as develop_request_id,
        min(case when startup_event in ('page_view', 'restart') then event_at end) as startup_start_time,
        -- getting our best guess of the startup time completion
        greatest(
            min(
                case when startup_event in ('complete', 'restore_work') then event_at end
            ),
            max(
                case when startup_event = 'first_successful_filetree_request_at' then event_at end
            )
        ) as startup_completion_time,
        datediff('s', startup_start_time, startup_completion_time) as startup_time_in_s

    from legacy_startup_events
    group by 1,2,3,4

),

startup_sessions as (


    select
        startup_id,
        '1.1' as ide_version,
        case
            when backfilled_is_cold_start then 'cold_start'
            else 'hot_start'
        end as start_type,
        max(backfilled_develop_request_id) as develop_request_id,
        --prework/start had null develop request id that was then filled
        --e.g. `where startup_id = '8f9330cc-f76a-4a5e-97fd-a2fb8fc90ea7`
        min(case when lifecycle_step = 'prework' then event_at end) as startup_start_time,
        max(case when lifecycle_step = 'ready' then event_at end) as startup_completion_time,
        datediff('s', startup_start_time, startup_completion_time) as startup_time_in_s

    from startup_events
    group by 1,2,3

),

final as (

    select * from legacy_startup_sessions

    union all 

    select * from startup_sessions
    
)

select * from final