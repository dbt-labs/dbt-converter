
{{ config(materialized='incremental', unique_key='event_id') }}

with event as (

    select * from {{ ref('current_snowplow_event') }}

)

select
    event.event_id,
    event.domain_userid,
    nullif(event.user_id::string,'') as user_id,
    event.domain_sessionid,
    event.database_source,
    event.collector_tstamp,
    event._loaded_at,
    event.derived_tstamp,
    event.event,
    event.event_name,
    unstruct_event:data:data as unstruct_event

from event
where event.unstruct_event is not null

{% if target.name in ['dev', 'default'] %}

    and _loaded_at >= dateadd(d, -{{var('testing_days_of_data')}}, current_date)

{% endif %}

{% if is_incremental() %}

    and event._loaded_at >= (select max(_loaded_at) from {{ this }})

{% endif %}
