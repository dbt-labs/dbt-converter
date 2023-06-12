with attendees as (

    select * from ANALYTICS.dbt_jstein.base_heysummit__attendees

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
        
    
md5(cast(coalesce(cast(attendee_id as TEXT), '') || '-' || coalesce(cast(question as TEXT), '') as TEXT)) as attendee_question_id,
        *
    
    from flattened

)

select * from with_id