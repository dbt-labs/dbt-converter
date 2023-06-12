
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

final as (

    select
        event_id,
        page_view_id,
        event_at,

        database_source,
        develop_request_id::varchar as develop_request_id,
        tenant_develop_request_id::varchar as tenant_develop_request_id,

        unstruct_event:data:data:filesize::string as tab_filesize,
        unstruct_event:data:data:linecount::string as tab_linecount,
        unstruct_event:data:data:name::string as tab_name,
        unstruct_event:data:data:source::string as tab_source,
        unstruct_event:data:data:type::string as tab_type

    from events
    where event_name = 'ide_tab_view'

)

select * from final