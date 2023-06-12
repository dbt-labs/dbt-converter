with

session_registrations as (

    select * from {{ ref('int__bizzabo_session_registrations') }}

),

session_attendance as (

    select * from {{ ref('int__bizzabo_session_checkins') }}

),

session_recording_views as (

    select * from {{ ref('int__bizzabo_recording_views') }}

),

sessions as (

    select * from {{ ref('stg_bizzabo__sessions') }}
    where is_deleted = false

),

salesforce_contacts as (

    select * from {{ ref('stg_salesforce__contacts') }}
    where is_deleted = false

),

unioned as (

    {{ dbt_utils.union_relations(
        relations=[
            ref('int__bizzabo_session_registrations'),
            ref('int__bizzabo_session_checkins'),
            ref('int__bizzabo_recording_views')
        ]
    )}}

),

aggregated as (

    select
        session_registration_id,
        session_id,
        registration_id,
        event_contact_id,
        contact_id,
        event_id,
        order_id,
        ticket_id,
        email,

        listagg(distinct attendance_type, ' & ') within group (order by attendance_type) as attendance_type,

        listagg(distinct watch_category, ' & ') within group (order by watch_category) as watch_category,

        coalesce(
            max(has_registered),
            false
        ) as has_registered,

        coalesce(
            max(has_attended_live),
            false
        ) as has_attended_live,

        coalesce(
            max(has_watched_recording),
            false
        ) as has_watched_recording,

        coalesce(
            max(is_checked_in_by_organizer),
            false
        ) as is_checked_in_by_organizer,

        coalesce(
            max(is_manual_override),
            false
        ) as is_manual_override,

        coalesce(
            max(is_virtual_checkin),
            false
        ) as is_virtual_checkin,

        sum(count_of_recording_views) as total_recording_views,
        count(count_of_unique_recording_viewers) as count_of_unique_recording_viewers,

        min(session_check_in_at) as session_check_in_at,
        max(session_check_out_at) as session_check_out_at
    
    from unioned
    {{ dbt_utils.group_by(9) }}

),

joined as (

    select
        aggregated.*,
        salesforce_contacts.contact_id as salesforce_contact_id,
        salesforce_contacts.account_id as salesforce_account_id,
        sessions.start_at as session_start_at,
        sessions.end_at as session_end_at,
        sessions.session_duration_in_seconds

    
    from aggregated
    left join sessions using (session_id)
    left join salesforce_contacts
        on aggregated.email = salesforce_contacts.email

),

cleaned as (

    select
        -- identifiers
        session_registration_id,
        session_id,
        registration_id,
        event_contact_id,
        contact_id,
        event_id,
        order_id,
        ticket_id,
        salesforce_contact_id,
        salesforce_account_id,
        email,

        -- dimensions
        case
            when attendance_type = '' then null
            else attendance_type
        end as attendance_type,

        case
            when watch_category = '' then null
            else watch_category
        end as watch_category,

        -- booleans
        has_registered,
        has_attended_live or has_watched_recording as has_attended,
        has_attended_live,
        has_watched_recording,
        is_checked_in_by_organizer,
        is_manual_override,
        is_virtual_checkin,

        -- timestamps

        -- the below cleans up any check ins that occured before a session started
        -- this is to make sure the max pct watched is 100%
        case
            when has_attended
                and session_check_in_at < session_start_at then session_start_at
            else session_check_in_at
        end as session_check_in_at,
        
        -- the below cleans up any session check outs that aren't logged, for these people we assume they were at the session for it's entirety
        -- this is mostly relevant for in person
        -- in addition, we clean up any check outs that occured after the session ended, to ensure pct_watched maxes at 100%
        case
            when has_attended
                and (session_check_out_at is null or session_check_out_at > session_end_at)
                then session_end_at
            else session_check_out_at
        end as session_check_out_at,

        session_start_at,
        session_end_at,

        -- metrics
        count_of_unique_recording_viewers,
        session_duration_in_seconds,
        total_recording_views

    from joined

),

final as (

    select
        *,
        datediff(seconds, session_check_in_at, session_check_out_at) as time_watched_in_seconds,
        time_watched_in_seconds / nullifzero(session_duration_in_seconds) as pct_session_watched
    
    from cleaned

)

select * from final
