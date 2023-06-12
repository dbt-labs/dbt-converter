{{
    config(
        materialized='incremental',
        unique_key='ide_lifecycle_id'
    )
}}

{%- set startup_id_sql = 'unstruct_event:data:data:startup_id::varchar' -%}

with 

events as (

    select
        *
    
    from {{ ref('stg_dbt_cloud_ide_events') }}
    where event_name = 'ide_refresh_lifecycle'

    {% if is_incremental() %}

        and {{ startup_id_sql }} in (

            select {{ startup_id_sql }} from {{ ref('stg_dbt_cloud_ide_events') }}
            where event_at > (select max(event_at) from {{ this }})

        )

    {% endif %}

),

json_parse as (

    select
        event_id,
        page_view_id,
        database_source,
        unstruct_event:data:data:id::varchar as ide_lifecycle_id,
        {{ startup_id_sql }} as startup_id,
        unstruct_event:data:data:develop_request_id::integer as develop_request_id,

        unstruct_event:data:data:cold_start::boolean as is_cold_start,
        unstruct_event:data:data:lifecycle_step::varchar as lifecycle_step,
        unstruct_event:data:data:total_duration_ms::numeric as total_duration_ms,

        event_at
  
    from events

),

hashing as (

    select
        event_id,
        page_view_id,
        database_source,
        ide_lifecycle_id,
        startup_id,
        {{ id_hashing(
            original_column_name = 'develop_request_id'
        ) }},        
        is_cold_start,
        lifecycle_step,
        total_duration_ms,
        event_at

    from json_parse

),

final as (

    select
        *,
        -- we only get the develop_request_id much later in the startup process
        -- this next line is intended to take the most reliable value for this
        last_value(develop_request_id) ignore nulls over (
            partition by startup_id
            order by event_at
        ) as backfilled_develop_request_id,

        -- we only get the is_cold_start value later in the startup process
        -- this next line takes the first value that we get back, usually the
        -- start stage has the correct is_cold_start value.
        first_value(is_cold_start) ignore nulls over (
            partition by startup_id
            order by event_at
        ) as backfilled_is_cold_start
    from hashing
    
)

select * from final
