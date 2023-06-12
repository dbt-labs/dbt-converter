with

source as (

    select * from {{ source('adp', 'worker_additional_remuneration') }}

),

renamed as (

    select
        worker_assignment_id,
        worker_id,

        rate_amount_value as amount,
        rate_currency_code as currency,
        
        effective_date
    
    from source

)

select * from renamed
