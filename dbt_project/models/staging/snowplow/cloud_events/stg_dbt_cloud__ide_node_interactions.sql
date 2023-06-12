{{
    config(
        materialized='incremental',
        unique_key='ide_dag_node_interaction_id'
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
        event_id as ide_dag_node_interaction_id,
        page_view_id,

        database_source,
        develop_request_id::varchar as develop_request_id,
        tenant_develop_request_id::varchar as tenant_develop_request_id,

        event_at,
        unstruct_event:data:data:request_id::string as request_id,
        unstruct_event:data:data:interaction_type::string as interaction_type,
        unstruct_event:data:data:current_file_path::string as current_file_path,
        unstruct_event:data:data:current_node_type::string as current_node_type,
        unstruct_event:data:data:target_file_path::string as target_file_path,
        unstruct_event:data:data:target_node_type::string as target_node_type
  
    from events
    where event_name = 'ide_dag_node_interaction'

)

select * from final
