with

source as (

    select * 
    from {{ metrics.calculate(
        metric('net_income'),
        grain='month',
        secondary_calculations=[metrics.period_over_period( comparison_strategy="ratio", interval=12, alias="yoy_growth")]
    ) }}

)

select * from source