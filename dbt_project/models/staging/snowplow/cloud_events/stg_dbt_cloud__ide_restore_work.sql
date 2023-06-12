{{
    config(
        materialized='incremental',
        unique_key='ide_restore_work_id'
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
        event_id as ide_restore_work_id,
        page_view_id,

        database_source,
        develop_request_id,

        unstruct_event:data:data:restored_tabs_count::numeric as restored_tabs_count,
        unstruct_event:data:data:restored_tabs_with_unsaved_work_count::numeric as restored_tabs_with_unsaved_work_count,

        event_at
  
    from events
    where event_name = 'ide_restore_work'

)

select * from final