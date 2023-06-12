with

attendees as (

    select * from {{ ref('base__crowdcast_event_attendance') }}

),

talk_lookup as (

    select * from {{ ref('stg_seed__coalesce_talk_details') }}

),

joined as (
    
    select
        attendees.*,
        talk_lookup.heysummit_event_id as event_id,
        talk_lookup.talk_id
    
    from attendees
    left join talk_lookup
        on attendees.talk_name = talk_lookup.talk_name_crowdcast

)

select * from joined