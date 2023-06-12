with 

overrides as (

    select * from {{ ref('stg_googlesheets__rev_schedule_overrides') }}

),

salesforce_schedules as (

    select * from {{ ref('stg_salesforce__rev_schedules') }}

),

salesforce_orders as (

    select * from {{ ref('stg_salesforce__orders') }}

),

enriched as (

    select
        salesforce_schedules.sfdc_rev_schedule_id,
        overrides.initial_catch_up_date,
        overrides.final_rollup_date,
        overrides.revenue_schedule_code,
        salesforce_orders.sfdc_order_id,
        overrides.order_number,
        overrides.revenue_start_date,
        overrides.revenue_end_date,
        overrides.revenue_amount,
        overrides.revenue_per_day,
        overrides.comment,
        overrides.as_of_date


    from overrides
    left join salesforce_schedules
        on overrides.revenue_schedule_code = salesforce_schedules.revenue_schedule_code
    left join salesforce_orders
        on overrides.order_number = salesforce_orders.order_number

),

dedupe as (

    select 
        *
    from enriched
    qualify row_number() over (partition by sfdc_rev_schedule_id order by as_of_date desc) = 1

)

select * from dedupe
