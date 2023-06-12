with

source as (

    select * from {{source('googlesheets', 'employee_locations')}}

),

renamed as (

    select
        _row as id,
        first_name || ' ' || last_name as name,
        first_name,
        last_name,
        zipcode,
        country_code,
        region

    from source

)

select * from renamed
