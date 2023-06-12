with attendees as (

    select * from {{ ref('base_heysummit__attendees') }}

),

flattened as (

    select
        attendee_id,
        value:question::string as question,
        value:answer::string as answer
    
    from attendees,
    lateral flatten (input => questions)

),

with_id as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'attendee_id',
            'question'
        ])}} as attendee_question_id,
        *
    
    from flattened

)

select * from with_id