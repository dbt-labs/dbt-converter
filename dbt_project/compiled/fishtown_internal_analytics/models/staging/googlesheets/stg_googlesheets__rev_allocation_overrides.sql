with source as (

    select * from raw.google_sheets.revenue_allocation_overrides

),

explicit_fields as (

    select
        order_number,
        ignore_revenue_reallocation,
        comment
    from source

)

select * from explicit_fields