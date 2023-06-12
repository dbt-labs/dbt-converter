with

attendees as (

    select * from ANALYTICS.dbt_jstein.base_heysummit__attendees

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
        
    
md5(cast(coalesce(cast(attendee_id as TEXT), '') || '-' || coalesce(cast(talk_id as TEXT), '') as TEXT)) as attendee_talk_id,
        *

    from talks_flattened

)

select * from with_id