

with 

events as (

    select * from analytics_dev.dbt_jstein.stg_dbt_cloud_ide_events
    where event_at > '2021-08-01' -- filtering event data before feature release
    

),

final as (

    select
        event_id as dag_knowledge_layer_request_id,
        page_view_id,

        database_source,
        develop_request_id::varchar as develop_request_id,
        tenant_develop_request_id::varchar as tenant_develop_request_id,

        event_at,
        unstruct_event:data:data:context_id::string as context_id,
        unstruct_event:data:data:request_id::string as request_id,
        unstruct_event:data:data:request_source::string as request_source,
        unstruct_event:data:data:selector::string as selector,
        unstruct_event:data:data:num_results::int as num_results,
        unstruct_event:data:data:timing::int as timing_in_ms
  
    from events
    where event_name = 'dag_knowledge_layer_request'

)

select * from final