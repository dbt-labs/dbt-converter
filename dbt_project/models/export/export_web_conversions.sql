with

web_conversions as (

    select * from {{ ref('fct_web_conversions') }}
    where inferred_user_id is not null

)

select * from web_conversions