with

attendees as (

    select * from {{ ref('base_heysummit__attendees') }}

),

talks_flattened as (

    select distinct
        attendee_id,
        email,
        nullif(value::string,'') as talk_url,
        regexp_substr(talk_url, '/talks/([0-9]+)', 1, 1, 'e') as talk_id
    
    from attendees,
    lateral flatten (input => talks, outer => true)

),

with_id as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'attendee_id',
            'talk_id'
        ])}} as attendee_talk_id,
        *

    from talks_flattened

)

select * from with_id