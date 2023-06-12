{{
    config(
        materialized='incremental',
        unique_key='ide_dag_render_id'
    )
}}

with 

events as (

    select * from {{ ref('stg_dbt_cloud_ide_events') }}
    where event_at > '2021-08-01' -- filtering event data before feature release
    {% if is_incremental() %}
        and event_at > (select max(event_at) from {{ this }})
    {% endif %}

),

final as (

    select
        event_id as ide_dag_render_id,
        page_view_id,

        database_source,
        develop_request_id::varchar as develop_request_id,
        tenant_develop_request_id::varchar as tenant_develop_request_id,

        event_at,
        unstruct_event:data:data:request_id::string as request_id,
        unstruct_event:data:data:num_edges::int as num_edges,
        unstruct_event:data:data:num_nodes::int as num_nodes, 
        unstruct_event:data:data:layout_timing::int as layout_timing,
        unstruct_event:data:data:render_timing::int as render_timing,
        unstruct_event:data:data:was_manually_requested::boolean as was_manually_requested
  
    from events
    where event_name = 'dag_render_event'

)

select * from final
