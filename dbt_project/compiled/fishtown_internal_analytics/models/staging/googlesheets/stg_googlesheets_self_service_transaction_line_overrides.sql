with 

source as (

    select * from raw.google_sheets.self_service_transaction_line_overrides

),

renamed as (

    select
        transaction_identifier,
        transaction_line_id,
        revenue_start_date::date as revenue_start_date_override,
        revenue_end_date::date as revenue_end_date_override,
        comment

    from source

)

select * from renamed