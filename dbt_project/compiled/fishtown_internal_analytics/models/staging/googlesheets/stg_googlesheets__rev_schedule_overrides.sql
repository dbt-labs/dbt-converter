with 

source as (

    select * from raw.google_sheets.revenue_schedule_overrides

),

renamed as (

    select
        source.initial_catch_up_date::date as initial_catch_up_date,
        source.final_rollup_date::date as final_rollup_date,
        source.revenue_schedule as revenue_schedule_code,
        lpad(source.order_number::string, 8,'0') as order_number,
        source.revenue_start_date::date as revenue_start_date,
        source.revenue_end_date::date as revenue_end_date,
        source.revenue_amount,
        source.revenue_per_day,
        source.comment,
        source.as_of_date::date as as_of_date


    from source

)

select * from renamed