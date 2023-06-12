with

questions as (

    select * from {{ ref('stg_bizzabo__tickets') }}
    where is_deleted = false

),

registrations as (

    select * from {{ ref('stg_bizzabo__registrations') }}

),

questions_flattened as (

    select
        ticket_id,
        event_id,
        value:label::string as question_label,
        value:mandatory::boolean as is_required,
        value:name::string as question_api_name,
        value:type::string as question_type
    
    from questions,
    lateral flatten (input => registration_properties)
    where value:name::string not in ('firstName', 'lastName', 'email')

),

registrations_flattened as (

    select
        registrations.registration_id,
        registrations.contact_id,
        registrations.event_id,
        registrations.order_id,
        registrations.ticket_id,
        key::string as question_api_name,
        value::string as answer
    
    from registrations,
    lateral flatten (input => registrant_properties)

),

joined as (

    select
        registrations_flattened.*,
        questions_flattened.question_type,
        questions_flattened.question_label
    
    from registrations_flattened
    inner join questions_flattened using (question_api_name, ticket_id)

),

with_id as (

    select
    {{ dbt_utils.generate_surrogate_key([
        'registration_id',
        'question_api_name',
    ]) }} as registration_question_id,
    *

    from joined
)

select * from with_id
