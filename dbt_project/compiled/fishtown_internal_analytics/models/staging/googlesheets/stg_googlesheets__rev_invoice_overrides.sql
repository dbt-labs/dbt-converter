with source as (

    select * from raw.google_sheets.revenue_invoice_overrides

),

renamed as (

    select
        revenue_schedule as revenue_schedule_code,
        lpad(source.order_number::string, 8,'0') as order_number,
        lpad(source.order_item_number::string, 10,'0') as order_item_number,
        credit_note,
        billing_finance_period_start_date::date as billing_finance_period_start_date,
        invoiced_amount,
        comment

    from source

)

select * from renamed