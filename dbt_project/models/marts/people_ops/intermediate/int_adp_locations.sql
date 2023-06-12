with

source as (

    select * from {{ ref('stg_adp__locations') }}

),

locations as (

    select * from {{ ref('country_codes') }}

),

joined as (

    select
        source.*,
        
        case
            when source.address_country_code = 'US'
                then 'United States'
            else locations.name 
        end as address_country_name

    from source
    left join locations
        on source.address_country_code = locations.two_letter_iso_code

)

select * from joined