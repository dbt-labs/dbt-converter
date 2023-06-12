with

source as (

    select * from {{ source('adp', 'location') }}

),

renamed as (

    select
        id as location_id,
        address_country_code,
        address_postal_code

    from source

)

select * from renamed