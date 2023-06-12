with

base as (

    select * from {{ ref('base__bizzabo_registrations') }}

),

parsed as (

    select
        base.*,

        -- The below 3 fields are mandatory for registrant properties
        -- Any additional fields can be found in `stg_bizzabo__questions`
        registrant_properties:firstName::string as first_name,
        registrant_properties:lastName::string as last_name,
        concat(
            registrant_properties:firstName::string,
            ' ',
            registrant_properties:lastName::string
        ) as full_name,
        lower(registrant_properties:email::string) as email,

        billing_address_properties:address1::string as billing_address,
        billing_address_properties:billedContact::string as billing_contact_name,
        billing_address_properties:city::string as billing_city,
        billing_address_properties:company::string as billing_company,
        billing_address_properties:country::string as billing_country,
        billing_address_properties:email::string as billing_email,
        billing_address_properties:firstName::string as billing_first_name,
        billing_address_properties:lastName::string as billing_last_name,
        billing_address_properties:state::string as billing_state,
        billing_address_properties:zip::string as billing_zip_code
    
    from base

),

with_id as (

    select
        parsed.*,
        {{ dbt_utils.generate_surrogate_key([
            'event_id',
            'contact_id'
        ])}} as event_contact_id
    
    from parsed
)

select * from with_id