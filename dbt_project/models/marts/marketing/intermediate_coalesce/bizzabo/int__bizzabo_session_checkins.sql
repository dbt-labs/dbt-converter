{%- set window_clause = 'partition by session_id, registration_id order by session_checkin_at' -%}

with

session_checkins as (

    select * from {{ ref('stg_bizzabo__session_checkins') }}
    where checkin_status in ('CheckIn','CheckOut')

),

registrations as (

    select * from {{ ref('stg_bizzabo__registrations') }}

),

grouped as (

    select
        session_id,
        registration_id,
        event_id,
        
        max(is_checked_in_by_organizer) as is_checked_in_by_organizer,

        -- the below is a min since we want to prioritize in-person attendance
        min(is_virtual_checkin) as is_virtual_checkin,

        max(is_manual_override) as is_manual_override,

        min(
            case
                when checkin_status = 'CheckIn' then session_checkin_at
            end
        ) as session_check_in_at,

        max(
            case
                when checkin_status = 'CheckOut' then session_checkin_at
            end
        ) as session_check_out_at
    
    from session_checkins
    group by 1,2,3

),

joined as (

    select
        grouped.session_id,
        grouped.registration_id,
        registrations.event_contact_id,
        registrations.contact_id,
        grouped.event_id,
        registrations.order_id,
        registrations.ticket_id,
        registrations.email,

        grouped.is_checked_in_by_organizer,
        grouped.is_virtual_checkin,
        grouped.is_manual_override,
        
        grouped.session_check_in_at,
        grouped.session_check_out_at

    from grouped
    left join registrations using (registration_id)

),

with_id as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'session_id',
            'registration_id',
        ])}} as session_registration_id,
        session_id,
        registration_id,
        event_contact_id,
        contact_id,
        event_id,
        order_id,
        ticket_id,
        email,

        case
            when is_virtual_checkin then 'Virtual'
            else 'In Person'
        end as attendance_type,

        'Live' as watch_category,

        case
            when session_check_in_at is not null then true
        end as has_attended_live,

        is_checked_in_by_organizer,
        is_manual_override,
        is_virtual_checkin,

        session_check_in_at,
        session_check_out_at
    
    from joined

)

select * from with_id