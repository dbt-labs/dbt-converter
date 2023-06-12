with

registrations as (

    select * from {{ ref('stg_bizzabo__registrations') }}

),

session_registrations_flattened as (

    select
        registration_id,
        event_contact_id,
        contact_id,
        event_id,
        order_id,
        ticket_id,
        value::integer as session_id,
        email,
        true as has_registered
    
    from registrations,
    lateral flatten (input => registrant_properties:sessionRegistration)
    where registrant_properties:sessionRegistration::string is not null

),

with_id as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'session_id',
            'registration_id'
        ])}} as session_registration_id,
        *
    
    from session_registrations_flattened
)

select * from with_id