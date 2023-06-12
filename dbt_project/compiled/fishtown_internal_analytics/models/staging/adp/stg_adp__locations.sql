with

source as (

    select * from raw.fivetran_adp_workforce_now.location

),

renamed as (

    select
        id as location_id,
        address_country_code,
        address_postal_code

    from source

)

select * from renamed