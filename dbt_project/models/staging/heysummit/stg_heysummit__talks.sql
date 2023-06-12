{{
  config(
    materialized = 'table'
  )
}}

with

source as (

    select * from {{ source('heysummit', 'talks') }}

),

talk_details as (

    select * from {{ ref('stg_seed__coalesce_talk_details') }}

),

renamed as (

    select

        id as talk_id,
        regexp_substr(event, '/events/([0-9]+)', 1, 1, 'e') as event_id,
        title,
        event,
        is_active,
        is_featured,
        nullif(parse_json(replace(categories,' None',' \'\'')),'[]') as categories,
        nullif(parse_json(replace(speakers,' None',' \'\'')),'[]') as speakers,
        date as talk_at

    from source

),

joined as (

    select * from renamed
    left join talk_details using (talk_id)

)

select * from joined