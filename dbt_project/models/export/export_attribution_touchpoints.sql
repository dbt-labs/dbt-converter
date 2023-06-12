with

touchpoints as (

    select * from {{ ref('int_attribution_events__unioned') }}

)

select * from touchpoints