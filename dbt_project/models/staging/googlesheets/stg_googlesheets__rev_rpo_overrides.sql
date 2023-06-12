with 

source as (

    select * from {{ source('googlesheets', 'revenue_rpo_overrides') }}

),

renamed as (

    select
        source.revenue_schedule_code,
        source.override_type,
        source.override_start_date::date as override_start_date,
        source.override_end_date::date as override_end_date,
        source.flat_amount,
        source.comment

    from source

)

select * from renamed
