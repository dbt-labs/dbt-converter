with

source as (

    select * from raw.bizzabo.session_checkins

),

renamed as (

    select
        sessionid as session_id,
        event_id,
        ticketid as registration_id,

        status as checkin_status,

        donebyorganizer as is_checked_in_by_organizer,
        overrule as is_manual_override,
        isvirtual as is_virtual_checkin,

        created::timestamp_ntz as session_checkin_at,
        _sdc_batched_at

    from source

),

with_id as (

    select
        md5(cast(coalesce(cast(event_id as TEXT), '') || '-' || coalesce(cast(session_id as TEXT), '') || '-' || coalesce(cast(registration_id as TEXT), '') || '-' || coalesce(cast(session_checkin_at as TEXT), '') as TEXT)) as session_checkin_id,
        *
    
    from renamed

)

select * from with_id