with

base as (

    select * from ANALYTICS.dbt_jstein.base__bizzabo_event_contacts

),

renamed as (

    select
        contact_id,
        event_id,
        properties:firstName::string as first_name,
        properties:lastName::string as last_name,
        concat(
            properties:firstName::string,
            ' ',
            properties:lastName::string
        ) as full_name,
        lower(properties:email::string) as email,
        properties,
        array_to_string(properties:role::array,', ') as roles,
        array_to_string(properties:ticketType::array,', ') as ticket_types,
        properties:hasTickets::boolean as has_tickets,
        created_at,
        modified_at,
        _sdc_batched_at,
        properties:ticketCount::integer as count_of_registrations

    from base

),

with_id as (

    select
        
    
md5(cast(coalesce(cast(event_id as TEXT), '') || '-' || coalesce(cast(contact_id as TEXT), '') as TEXT)) as event_contact_id,
        *
    
    from renamed
    
)

select * from with_id