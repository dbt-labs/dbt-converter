
with 

source as (

    select * from {{ ref('stg_adp__person_history') }}

),

country_codes as (

    select * from {{ ref('country_codes') }}

),

synth as (

    select
        source.*,

        case
            when source.legal_address_country_code = 'US'
                then 'United States'
            else country_codes.name
        end as legal_address_country_name,
            
        country_codes.three_letter_iso_code as legal_address_country_code_extended

    from source
    left join country_codes
        on source.legal_address_country_code = country_codes.two_letter_iso_code

)

select * from synth