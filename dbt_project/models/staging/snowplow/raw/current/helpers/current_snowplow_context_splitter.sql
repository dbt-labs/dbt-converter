
{{
    config(
        materialized='incremental',
        unique_key='event_id',
        cold_storage=true,
        cold_storage_date_type='relative',
        cold_storage_period=var('cold_storage_default_period'),
        cold_storage_value=var('cold_storage_default_value')
    )
}}

with event as (

    select * from {{ ref('current_snowplow_event') }}

)

select
    event.event_id,
    event.user_id,
    event.collector_tstamp,
    event.etl_tstamp,
    event._loaded_at,
    event.event,
    event.event_name,
    event.se_label,
    context.index as context_index,
    REGEXP_SUBSTR(context.value:schema::string, '\/([a-zA-Z_]+)\/jsonschema', 1, 1, 'e') as context_type,
    context.value:data as context

from event,
lateral flatten (input => contexts:data) context

where 1=1
    {{ enhanced_incremental_filters(
        ref_timestamp='_loaded_at',
        this_timestamp='_loaded_at'
    )}}
