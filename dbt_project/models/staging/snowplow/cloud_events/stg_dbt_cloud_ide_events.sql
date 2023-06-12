
{{
    config(
        materialized='incremental',
        unique_key='event_id'
    )
}}


with events as (

    select * from {{ ref('stg_snowplow_web_events') }}
    where 1=1
    {% if target.name in ['dev', 'default'] %}

        and _loaded_at >= dateadd(d, -{{var('testing_days_of_data')}}, current_date)

    {% endif %}

    {% if is_incremental() %}
    
        and _loaded_at > (select max(_loaded_at) from {{ this }})
    
    {% endif %}

),

web_page_context as (

    select * from {{ ref('stg_snowplow_web_page_contexts') }}

),

ide_context_flattened as (
    -- filters events to those with an ide_context

    select
        events.*,
        nullif(
            c.value:data:label::string,
            '-1')
            as develop_request_id
        --[July-Aug 2022] We were mistakeningly populating the
        --develop_request_id with a -1 if the event didnt
        --recognize a develop request. This was resolved Aug 18 22
        --link to slack: https://dbt-labs.slack.com/archives/C03EUNG9YP8/p1660851135295099

    from events,
        lateral flatten (input => contexts:data) c
    where c.value:schema ilike '%iglu:com.dbt/ide_context%'

),

missing_ide_contexts as (
    -- filters events for ide-1.1 and cloud-ui where an ide_context does not exist
    -- because it either wasn't added in tracking or is in unstruct_events (which is coalesced later)

    select
        *,
        unstruct_event:data:data:develop_request_id::string as develop_request_id
    
    from events
    where app_id in ('ide-1.1', 'cloud-ui')
        and contexts not ilike '%iglu:com.dbt/ide_context%'

),

unioned as (
    -- the above CTEs are mutually exclusive, so this should not duplicate data
    -- reference this Slack thread above (in context_flattened CTE)

    select * from ide_context_flattened
    union all
    select * from missing_ide_contexts

),

joined as (

    select
        unioned.*,
        web_page_context.id as page_view_id

    from unioned
    join web_page_context
        on unioned.event_id = web_page_context.root_id

),

add_hashing as (

    select 

        app_id,
        event_id,
        page_view_id,

        collector_tstamp as event_at,
        event_name,
        event,
        user_ipaddress,
        page_urlhost,
        database_source,

        se_category,
        se_action,
        se_label,
        se_property,
        se_value,

        {{ id_hashing(
            original_column_name = 'develop_request_id'
        ) }},

        unstruct_event,
        _loaded_at

    from joined

)

select * from add_hashing