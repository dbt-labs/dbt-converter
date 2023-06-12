
{{
    config(
        materialized='incremental',
        unique_key='event_id'
    )
}}

with events as (

    select * from {{ ref('stg_dbt_cloud_ide_events') }}

    {% if is_incremental() %}
    where event_at > (select max(event_at) from {{ this }})
    {% endif %}

),

invocation_start as (

    select
        event_id,
        page_view_id,
        event_at,

        database_source,
        develop_request_id::varchar as develop_request_id,
        tenant_develop_request_id::varchar as tenant_develop_request_id,

        unstruct_event:data:data:id::string as invocation_id,
        unstruct_event:data:data:source::string as invocation_source,
        unstruct_event:data:data:type::string as invocation_command

    from events
    where event_name = 'ide_invocation_start'

),

invocation_complete as (

    select distinct
          unstruct_event:data:data:id::string as invocation_id,
          unstruct_event:data:data:status::string as invocation_status,
          unstruct_event:data:data:timing::float as invocation_timing

    from events
    where event_name = 'ide_invocation_complete'
    qualify row_number() over (
        partition by 
            invocation_id
        order by
            event_at
    ) = 1
--there is one blip where a dev had two complete events pop up.
--confirmed with Dev Experience team that, moving forward, if
--we see this more often then we can take the _first_ invo complete event.
--but we remove the event_id bc the duplicate invocation counts as two 
--events but we really only want to see the time to invocation complete.

),

joined as (

    select
        invocation_start.event_id,
        invocation_start.page_view_id,
        invocation_start.event_at,
        invocation_start.database_source,

        invocation_start.develop_request_id,
        invocation_start.tenant_develop_request_id,
        invocation_start.invocation_id,

        invocation_start.invocation_source,

        'dbt ' || invocation_start.invocation_command as invocation_command,
        split_part(invocation_start.invocation_command, ' ', 1) as invocation_command_type,

        coalesce(
            case invocation_complete.invocation_status
                when 'success' then 'success'
                when 'killed' then 'cancel'
                when 'failed' then 'error'
            end,
            'incomplete'
        ) as invocation_status,

        invocation_complete.invocation_status = 'success' as is_success,
        invocation_complete.invocation_status = 'killed' as is_canceled,
        invocation_complete.invocation_status = 'failed' as is_error,
        invocation_complete.invocation_status = 'incomplete' as is_incomplete,

        invocation_complete.invocation_timing as invocation_runtime_in_seconds

    from invocation_start
    left join invocation_complete on invocation_start.invocation_id = invocation_complete.invocation_id

)

select * from joined