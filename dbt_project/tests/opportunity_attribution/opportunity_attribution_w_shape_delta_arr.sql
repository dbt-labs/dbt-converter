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
        round(delta_arr,0) as delta_arr,
        round(sum(attributed_delta_arr_w_shape),0) as sum_attributed_delta_arr_w_shape

    from opportunity_attribution
    group by 1,2

)

select * from aggregated
where delta_arr != sum_attributed_delta_arr_w_shape