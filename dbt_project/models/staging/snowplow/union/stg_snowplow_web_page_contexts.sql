{{
  config(
    materialized = "table"
  )
}}

with fishtown as (

    select * from {{ ref('current_snowplow_web_page') }}

),

fivetran as (

    select * from {{ ref('historical_snowplow_web_page_context') }}

),

unioned as (

    select * from fishtown
    union all
    select * from fivetran

),

renamed as (

    select
        event_id as root_id,
        id,
        max(_loaded_at) as _loaded_at

    from unioned
    group by 1, 2

)

select * from renamed
