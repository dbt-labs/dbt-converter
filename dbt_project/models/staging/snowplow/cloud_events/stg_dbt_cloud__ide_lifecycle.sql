{{
    config(
        materialized='incremental',
        unique_key='ide_lifecycle_id'
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
        event_id as ide_lifecycle_id,
        page_view_id,

        database_source,
        
        unstruct_event:data:data:type::varchar as lifecycle_type,

        event_at
  
    from events
    where event_name = 'ide_lifecycle'

)

select * from final