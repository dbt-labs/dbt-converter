--this model contains all Coalesce registrants and the talks they attended (and whether they registered for it)
with

attendees_info as (

    select * from {{ ref('stg_heysummit__attendees') }}

),

attendance as (

    select * from {{ ref('stg_crowdcast__event_attendance') }}

),

registered as (

    select * from {{ ref('stg_heysummit__attendee_talks') }}

),

talks as (

    select * from {{ ref('stg_heysummit__talks') }}

),

-------The below CTEs are to union all talk attendances (registered and non-registered)
-------and general event registrations.

attendee_emails as (

    select 
        attendee_id,
        email
    from attendees_info
    qualify row_number() over (
        partition by email
        order by is_registered desc, registered_at desc
    ) = 1

),

talks_attended as (

    select
        attendee_emails.attendee_id,
        attendance.talk_id::varchar as talk_id,
        attendance.email,

        talks.title as talk_name,

        registered.talk_id is not null as did_register_for_talk,
        attendance.did_attend as did_attend,
        false as was_no_show

    from attendance
    left join registered using (talk_id, email)
    left join attendee_emails using (email)
    left join talks using (talk_id)

),

talks_registered as (

    select
        registered.attendee_id,
        registered.talk_id::varchar as talk_id,
        registered.email,

        talks.title as talk_name,

        case
            when registered.talk_id is not null
                then true
        end as did_register_for_talk,
        --if this is a line item for a talk,
        --then it is true. but if it is null
        --then it's a Coalesce Conf registration
        --and should therefore be true

        attendance.did_attend,
        attendance.did_attend = 'no' as was_no_show

    from registered
    left join attendance using (talk_id, email)
    left join talks using (talk_id)

),

all_registrations as (

    select * from talks_registered

    union all

    select * from talks_attended
    where did_attend
    and not did_register_for_talk

),

-------Now the below CTEs are to enrich our talk attendees' data

attendee_enrichment as (

    select *
    from all_registrations
    left join attendees_info using (attendee_id, email)
    --attaching email in the join so we can use the *
    --to select all fields

),

with_id as (

    select
        {{dbt_utils.generate_surrogate_key([
            'attendee_id',
            'talk_id',
            'email'
        ])}} as registration_id,
        *

    from attendee_enrichment

)

select * from with_id