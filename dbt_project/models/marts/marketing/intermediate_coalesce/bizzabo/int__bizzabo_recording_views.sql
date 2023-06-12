with

recording_views as (

    select * from {{ ref('stg_bizzabo__recording_views') }}

),

registrations as (

    select * from {{ ref('stg_bizzabo__registrations' )}}

),

grouped as (

    select
        session_id,
        registration_id,
        event_id,
        
        min(viewed_recording_at) as viewed_recording_at,

        count(*) as count_of_recording_views,
        count(distinct registration_id) as count_of_unique_recording_viewers
    
    from recording_views
    group by 1,2,3

),

joined as (

    select
        grouped.*,
        registrations.contact_id,
        registrations.event_contact_id,
        registrations.order_id,
        registrations.ticket_id,
        registrations.email,
        'Virtual' as attendance_type,
        'On Demand' as watch_category
    
    from grouped
    left join registrations using (registration_id)

),

with_id as (

    select
        {{dbt_utils.generate_surrogate_key([
            'session_id',
            'registration_id'
        ])}} as session_registration_id,
        session_id,
        registration_id,
        event_contact_id,
        contact_id,
        event_id,
        order_id,
        ticket_id,
        email,

        attendance_type,
        watch_category,

        true as has_watched_recording,

        viewed_recording_at,

        count_of_recording_views,
        count_of_unique_recording_viewers

    from joined

)

select * from with_id