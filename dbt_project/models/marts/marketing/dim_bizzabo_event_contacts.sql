with

bizzabo_contacts as (

    select * from {{ ref('stg_bizzabo__event_contacts') }}

),

session_registrations as (

    select * from {{ ref('int__bizzabo_session_registrations') }}

),

registrations as (
    
    select * from {{ ref('fct_bizzabo_registrations') }}

),

session_calcs as (

    select
        event_contact_id,
        count(*) as count_of_registered_sessions
    
    from session_registrations
    group by 1

),

registration_calcs as (

    select
        event_contact_id,
        salesforce_contact_id,
        salesforce_account_id,
        min(registered_at) as first_registered_at,
        sum(charge_amount) as total_revenue

    from registrations
    group by 1,2,3

),

joined as (
    
    select
        bizzabo_contacts.*,
        registration_calcs.salesforce_contact_id,
        registration_calcs.salesforce_account_id,
        registration_calcs.first_registered_at,
        coalesce(registration_calcs.total_revenue,0) as total_revenue,
        coalesce(session_calcs.count_of_registered_sessions,0) as count_of_registered_sessions
    
    from bizzabo_contacts
    left join registration_calcs
        on bizzabo_contacts.event_contact_id = registration_calcs.event_contact_id
    left join session_calcs
        on bizzabo_contacts.event_contact_id = session_calcs.event_contact_id
   
),

final as (
    
    select
        -- identifiers
        event_contact_id,
        contact_id,
        event_id,
        salesforce_contact_id,
        salesforce_account_id,

        -- dimensions
        first_name,
        last_name,
        full_name,
        email,
        properties,
        roles,
        ticket_types,

        -- booleans
        has_tickets,

        -- timestamps
        created_at, 
        modified_at,
        first_registered_at,

        -- measures
        count_of_registrations,
        count_of_registered_sessions,
        total_revenue
    
    from joined

)

select * from final