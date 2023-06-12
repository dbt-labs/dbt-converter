{{
    config(
        materialized='incremental',
        unique_key='ide_filesystem_id'
    )
}}

with 

events as (

    select * from {{ ref('stg_dbt_cloud_ide_events') }}
    {% if is_incremental() %}
        where event_at > (select max(event_at) from {{ this }})
    {% endif %}

),

ide_context as (

    select * from {{ ref('current_snowplow_ide_context') }}
    where action = 'develop_request_id'
      and category = 'ide'
-- need to qualify this to a single row, but want to loop AEscay in first

),

final as (

    select distinct --reduces the fan from ide_context
        event_id as ide_filesystem_id,
        page_view_id,
        database_source,
        ide_context.label as develop_request_id,

        unstruct_event:data:data:type::varchar as filesystem_event_type,
        unstruct_event:data:data:count_files::integer as  count_files,
        unstruct_event:data:data:timing::numeric/1000 as total_duration_in_s,

        unstruct_event:data:data:status::varchar as event_status,
        unstruct_event:data:data:error_logs::varchar as error_logs,

        event_at
  
    from events
    left join ide_context using (event_id)
    where event_name = 'ide_filesystem'

)

select * from final
