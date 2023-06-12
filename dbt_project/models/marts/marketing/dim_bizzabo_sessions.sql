with

sessions as (

    select * from {{ ref('stg_bizzabo__sessions') }}
    where is_deleted = false

),

activity as (

    select * from {{ ref('fct_bizzabo_session_activity') }}

),

locations as (

    select * from {{ ref('stg_bizzabo__locations') }}

),

calcs as (

    select
        session_id,

        count(distinct
            case
                when has_registered = true then registration_id
            end
        ) as count_of_registrations,

        count(distinct
            case
                when has_attended = true then registration_id
            end
        ) as count_of_attendees,

        count(distinct
            case
                when has_attended_live = true then registration_id
            end
        ) as count_of_live_attendees,

        count(distinct
            case
                when has_attended = true and is_virtual_checkin = true then registration_id
            end
        ) as count_of_virtual_attendees,

        count(distinct
            case
                when has_attended = true and is_virtual_checkin = false then registration_id
            end
        ) as count_of_in_person_attendees,

        sum(count_of_unique_recording_viewers) as count_of_unique_recording_viewers,
        sum(total_recording_views) as total_recording_views,

        sum(
            case
                when has_attended = true then time_watched_in_seconds
            end
        ) as total_time_watched_in_seconds,

        avg(
            case
                when has_attended = true then time_watched_in_seconds
            end
        ) as avg_time_watched_in_seconds,

        avg(
            case
                when has_attended = true then pct_session_watched
            end
        ) as avg_pct_watched
    
    from activity
    group by 1

),

joined as (

    select
        sessions.*,
        locations.location_name,
        locations.sublocation_name,
        coalesce(calcs.count_of_registrations,0) as count_of_registrations,
        coalesce(calcs.count_of_attendees,0) as count_of_attendees,
        coalesce(calcs.count_of_live_attendees,0) as count_of_live_attendees,
        coalesce(calcs.count_of_virtual_attendees,0) as count_of_virtual_attendees,
        coalesce(calcs.count_of_in_person_attendees,0) as count_of_in_person_attendees,
        coalesce(calcs.count_of_unique_recording_viewers,0) as count_of_unique_recording_viewers,
        coalesce(calcs.total_recording_views,0) as total_recording_views,
        coalesce(calcs.total_time_watched_in_seconds,0) as total_time_watched_in_seconds,
        calcs.avg_time_watched_in_seconds,
        calcs.avg_pct_watched
    
    from sessions
    left join locations
        on sessions.location_lookup_id = locations.location_lookup_id
    left join calcs
        on sessions.session_id = calcs.session_id

),

final as (

    select
        -- identifiers
        session_id,
        event_id,
        location_id,
        sublocation_id,
        external_id,

        -- dimensions
        case
            when associated_contacts = '{}' then null
            else associated_contacts
        end as associated_contacts,

        description,
        description_html,
        filters,
        speakers,
        sponsors,
        title,
        virtual_session_details,
        virtual_session_details:sessionType::string as virtual_session_type,
        virtual_session_details:videoProviderType::string as virtual_session_video_provider,
        virtual_session_details:virtualSessionAuthorizations::variant as virtual_session_authorizations,
        virtual_session_details:virtualSessionRecordingAuthorizations::variant as virtual_session_recording_authorizations,
        location_name,
        sublocation_name,

        -- booleans
        allow_rating,
        has_registration,
        has_registration_capacity_enabled,
        is_hidden,
        is_private,
        is_registration_full,
        is_registration_visible,
        is_virtual_session,

        -- timestamps
        start_at,
        end_at,
        session_duration_in_seconds,

        -- measures
        count_of_registrations,
        count_of_attendees,
        count_of_live_attendees,
        count_of_virtual_attendees,
        count_of_in_person_attendees,
        count_of_unique_recording_viewers,
        total_recording_views,
        total_time_watched_in_seconds,
        avg_time_watched_in_seconds,
        avg_pct_watched

    
    from joined

)

select * from final