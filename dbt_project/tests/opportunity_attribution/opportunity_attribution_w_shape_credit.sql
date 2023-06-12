{{ config(
    severity = 'warn'
) }}

with

opportunity_attribution as (

    select * from {{ ref('fct_opportunity_attribution') }}

),

aggregated as (
    
    -- we aren't entirely concerened with precision down to the decimal, therefore rounding is sufficient
    select
        opportunity_id,
        round(sum(touchpoint_credit_w_shape),2) as sum_touchpoint_credit_w_shape

    from opportunity_attribution
    group by 1
    having sum_touchpoint_credit_w_shape < 1
        or sum_touchpoint_credit_w_shape > 1

)

select * from aggregated