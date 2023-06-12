

with 

events as (

    select * from analytics_dev.dbt_jstein.stg_dbt_cloud_ide_events
    where event_at > '2021-08-01' -- filtering event data before feature release
    

),

final as (

    select
        event_id as ide_dag_view_start_id,
        page_view_id,

        database_source,
        develop_request_id::varchar as develop_request_id,
        tenant_develop_request_id::varchar as tenant_develop_request_id,

        event_at,
        unstruct_event:data:data:context_id::string as context_id,
        unstruct_event:data:data:parent_context_id::string as parent_context_id,
        unstruct_event:data:data:view_name::string as view_name
  
    from events
    where event_name = 'ide_dag_view_start'

)

select * from final