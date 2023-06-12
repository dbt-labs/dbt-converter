with

events as (

    select * from {{ ref('stg_bizzabo__events') }}

),

registrations as (

    select * from {{ ref('fct_bizzabo_registrations') }}
    where status = 'completed'

),

session_activity as (

    select * from {{ ref('fct_bizzabo_session_activity') }}

),

registration_calcs as (

    select
        event_id,

        count(distinct contact_id) as count_of_contacts,
        count(distinct registration_id) as count_of_registrations,

        count(distinct
            case
              when has_attended then registration_id
            end
        ) as count_of_attendees,

        count(distinct
            case
                when has_attended_live then registration_id
            end
        ) as count_of_live_attendees,

        count(distinct
            case
                when has_watched_recording then registration_id
            end
        ) as count_of_unique_recording_viewers,

        count(distinct order_id) as count_of_orders,
        coalesce(sum(charge_amount),0) as total_revenue

    
    from registrations
    group by 1

),

session_activity_calcs as (

    select
        event_id,
        sum(total_recording_views) as total_recording_views
    
    from session_activity
    group by 1

),

joined as (

    select * from events
    left join registration_calcs using (event_id)
    left join session_activity_calcs using (event_id)

)

select * from joined