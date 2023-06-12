{{
    config(
        materialized='incremental',
        unique_key='ide_git_operation_id'
    )
}}

with 

events as (

    select * from {{ ref('stg_dbt_cloud_ide_events') }}
    {% if is_incremental() %}
        where event_at > (select max(event_at) from {{ this }})
    {% endif %}

),

final as (

    select
        event_id,
        page_view_id,
        database_source,
        app_id,

        unstruct_event:data:data:id::varchar as ide_git_operation_id,
        unstruct_event:data:data:type::varchar as git_operation_type,
        unstruct_event:data:data:current_status::varchar as current_status,

        event_at
  
    from events
    where event_name = 'ide_git_operation'

)

select * from final
