with

page_views as (

    select * from {{ ref('fct_web_pageviews') }}
    where cloud_page_type = 'ide'

),

ide_lifecycle as (

    select * from {{ ref('stg_dbt_cloud__ide_lifecycle') }}

),

ide_lifecycle_complete as (

    select * from {{ ref('stg_dbt_cloud__ide_lifecycle_complete') }}

),

ide_restore_work as (

    select * from {{ ref('stg_dbt_cloud__ide_restore_work') }}

),

develop_requests as (

    select * from {{ ref('int_cloud__develop_requests') }}

),

frontend_events as (

    select
        page_view_id,
        page_view_id as event_id,
        null as develop_request_id,
        'page_view' as startup_event,
        page_view_start as event_at

    from page_views
    
    union all

    select
        page_view_id,
        ide_lifecycle_id as event_id,
        null as develop_request_id,
        'restart' as startup_event,
        event_at
    
    from ide_lifecycle
    where lifecycle_type = 'restart'

    union all

    select
        page_view_id,
        ide_lifecycle_id as event_id,
        null as develop_request_id,
        'start' as startup_event,
        event_at
    
    from ide_lifecycle
    where lifecycle_type = 'start'

    union all

    select
        page_view_id,
        ide_lifecycle_complete_id as event_id,
        develop_request_id,
        'complete' as startup_event,
        event_at
    
    from ide_lifecycle_complete
    where complete_status = 'success'

    union all

    select
        page_view_id,
        ide_lifecycle_complete_id as event_id,
        null as develop_request_id,
        'error' as startup_event,
        event_at
    
    from ide_lifecycle_complete
    where complete_status = 'error'   

    union all

    select
        page_view_id,
        ide_restore_work_id as event_id,
        develop_request_id,
        'restore_work' as startup_event,
        event_at
    
    from ide_restore_work

),

backend_events as (

    select
        develop_request_id,
        'first_successful_health_check_at' as startup_event,
        first_successful_health_check_at as event_at

    from develop_requests
    where first_successful_health_check_at is not null

    union all 

    select
        develop_request_id,
        'first_successful_filetree_request_at' as startup_event,
        first_successful_filetree_request_at as event_at

    from develop_requests
    where first_successful_filetree_request_at is not null

    union all

    select
        develop_request_id,
        'ready_at' as startup_event,
        ready_at as event_at

    from develop_requests
    where ready_at is not null

),

events_flags as (

    select
        *,
        lag(startup_event) over (
            partition by page_view_id
            order by event_at
        ) as lag_event,
        lead(startup_event) over (
            partition by page_view_id
            order by event_at
        ) as lead_event,
        case
            when startup_event = 'page_view'
             and lead_event = 'start'
                then 'cold_start'
            when startup_event = 'restart'
                then 'cold_start'
            when startup_event = 'page_view'
             and lead_event = 'restore_work'
                then 'hot_start'
            -- fall back page view event without the first 2 conditions above
            -- most likely means it's a warm start (this is a guesstimate)
            when startup_event = 'page_view'
                then 'warm_start'
        end as start_type,
        case
            when start_type is not null
             and startup_event = 'restart'
                then 'manual_restart'
            when start_type is not null
                then 'automated_start'
        end as startup_trigger,
        case
            when start_type is not null
            then 1
            else 0
        end as active_session_start_flag

    from frontend_events

),

events_grouping as (

    select
        *,
        sum(active_session_start_flag) over (
            partition by page_view_id
            order by event_at
            rows between unbounded preceding and current row
        ) as frontend_active_session_grouping

    from events_flags
),

frontend_develop_requests_backfilled as (

    select
        *,
        first_value(develop_request_id) ignore nulls over (
            partition by page_view_id, frontend_active_session_grouping
            order by event_at
            rows between current row and unbounded following
        ) as backfilled_develop_request_id
    
    from events_grouping

),

events_unioned as (

    select 
        'frontend' as event_source,
        * 
    from frontend_develop_requests_backfilled

    union all

    select 
        'backend' as event_source,
        null as page_view_id,
        null as event_id,
        *,
        null as lag_event,
        null as lead_event,
        null as start_type,
        null as startup_trigger,
        null as active_session_start_flag,
        null as frontend_active_session_grouping,
        develop_request_id as backfilled_develop_request_id
    from backend_events

),

final as (

    select
        *,
        last_value(page_view_id) ignore nulls over (
            partition by backfilled_develop_request_id
            order by event_at
            rows between unbounded preceding and current row
        ) as backfilled_page_view_id,
        {{ dbt_utils.generate_surrogate_key(['backfilled_page_view_id', 'backfilled_develop_request_id']) }} as active_session_id
    from events_unioned

)

select * from final
