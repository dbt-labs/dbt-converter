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

        -- this id is the same as the one found in stg_dbt_cloud__ide_git_operation
        unstruct_event:data:data:id::varchar as ide_git_operation_id,
        unstruct_event:data:data:timing::numeric as timing_in_ms,
        unstruct_event:data:data:status::varchar as completion_status,
        unstruct_event:data:data:error_logs::varchar as error_logs,

        event_at
  
    from events
    where event_name = 'ide_git_operation_complete'

)

select * from final