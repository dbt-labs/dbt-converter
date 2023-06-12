with

source as (

    select * from {{ source('bizzabo', 'session_checkins') }}

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
        {{ dbt_utils.generate_surrogate_key([
            'event_id',
            'session_id',
            'registration_id',
            'session_checkin_at'
        ])}} as session_checkin_id,
        *
    
    from renamed

)

select * from with_id