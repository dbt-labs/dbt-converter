

with events as (

    select * from analytics_dev.dbt_jstein.stg_dbt_cloud_ide_events

    

),

operation_start as (

    select
        event_id,
        page_view_id,
        event_at,

        database_source,
        develop_request_id::varchar as develop_request_id,
        tenant_develop_request_id::varchar as tenant_develop_request_id,

        unstruct_event:data:data:id::string as operation_id,
        unstruct_event:data:data:filename::string as tab_name,
        unstruct_event:data:data:source::string as operation_source,
        unstruct_event:data:data:type::string as operation_type

    from events
    where event_name = 'ide_sql_operation_start'

),

operation_complete as (

    select
          event_id,

          unstruct_event:data:data:id::string as operation_id,
          unstruct_event:data:data:status::string as operation_status,
          unstruct_event:data:data:timing::float as operation_runtime

    from events
    where event_name = 'ide_sql_operation_complete'

),

joined as (

    select
        operation_start.event_id,
        operation_start.page_view_id,
        operation_start.event_at,
        operation_start.database_source,
        operation_start.develop_request_id,
        operation_start.tenant_develop_request_id,
        operation_start.operation_id,

        operation_start.tab_name,
        operation_start.operation_source,
        operation_start.operation_type,

        case operation_complete.operation_status
            when 'success' then 'success'
            when 'killed' then 'cancel'
            when 'error' then 'error'
        end as operation_status,

        operation_complete.operation_status = 'success' as is_success,
        operation_complete.operation_status = 'killed' as is_canceled,
        operation_complete.operation_status = 'error' as is_error,

        operation_complete.operation_runtime / 1000.0 as operation_runtime_in_seconds

    from operation_start
    left join operation_complete on operation_start.operation_id = operation_complete.operation_id

),

deduped as (
--a temporary fix until we can understand why some completed
--operation_ids are duplicating
    select
        *,
        row_number() over (
            partition by event_id
            order by event_at
        ) as dedupe_index

    from joined

)

select * from deduped
where dedupe_index = 1