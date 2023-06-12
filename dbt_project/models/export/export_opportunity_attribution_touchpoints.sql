with

opportunity_attribution as (

    select * from {{ ref('fct_opportunity_attribution') }}

)

select * from opportunity_attribution