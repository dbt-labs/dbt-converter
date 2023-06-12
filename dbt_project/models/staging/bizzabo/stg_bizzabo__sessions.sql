with

base as (

    select * from {{ ref('base__bizzabo_sessions') }}
    
),

parsed as (

    select
        session_id,
        event_id,
        location_id,
        sublocation_id,
        external_id,

        associated_contacts,
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

        allow_rating,
        has_registration,
        has_registration_capacity_enabled,
        is_hidden,
        is_private,
        is_registration_full,
        is_registration_visible,
        is_virtual_session,

        count_registrations,

        dateadd('minute',start_minute,start_at)::timestamp_ntz as start_at,
        dateadd('minute',end_minute,end_at)::timestamp_ntz as end_at,

        _sdc_batched_at,

        case
            when _sdc_batched_at::date < (select dateadd('day',-1,max(_sdc_batched_at))::date as _sdc_batched_at_date from base) then true
            else false
        end as is_deleted
    
    from base

),

with_id as (

    select
        *,
        datediff('second',start_at, end_at) as session_duration_in_seconds,
        {{ dbt_utils.generate_surrogate_key([
            'location_id',
            'sublocation_id'
        ])}} as location_lookup_id
    
    from parsed

)

select * from with_id