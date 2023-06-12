{{
  config(
    materialized = 'table'
  )
}}

with

source as (

    select * from {{ source('heysummit', 'events') }}

),

renamed as (

    select

        id as event_id,
        title,
        event_url,
        is_archived,
        is_evergreen,
        is_live,
        is_open_for_registrations,
        first_talk_at,
        last_talk_at

    from source

)

select * from renamed