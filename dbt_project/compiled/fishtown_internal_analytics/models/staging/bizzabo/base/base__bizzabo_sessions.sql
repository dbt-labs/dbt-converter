with

source as (

    select * from raw.bizzabo.sessions

),

renamed as (

    select
        id as session_id,
        event_id,
        locationid as location_id,
        sublocationid as sublocation_id,
        externalid as external_id,

        parse_json(associatedcontacts) as associated_contacts,
        description,
        descriptionhtml as description_html,
        filters,
        parse_json(speakers) as speakers,
        parse_json(sponsors) as sponsors,
        title,
        parse_json(virtualsessiondetails) as virtual_session_details,

        allowrating as allow_rating,
        registration as has_registration,
        registrationcapacityenable as has_registration_capacity_enabled,
        hidden::boolean as is_hidden,
        private as is_private,
        registrationfull as is_registration_full,
        registrationvisibility as is_registration_visible,
        enablevirtualsession as is_virtual_session,

        registrationcount as count_registrations,

         convert_timezone(
            'America/Chicago',
            'UTC',
            startdate::date
        ) as start_at,

        startminute as start_minute,
        
         convert_timezone(
            'America/Chicago',
            'UTC',
            enddate::date
        ) as end_at,

        endminute as end_minute,
        _sdc_batched_at

    from source

)

select * from renamed