with source as (

    select * from {{ source('googlesheets', 'revenue_transaction_overrides') }}

),

renamed as (

    select
        sfdc_rev_schedule_id,
        revenue_schedule_code,
        rev_transaction_amount,
        recognition_date::date as recognition_date,
        comment

    from source

)

select * from renamed
