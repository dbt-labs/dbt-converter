with

source as (

    select * from {{ source('bizzabo', 'session_recording_views') }}

),

renamed as (

    select
        id as recording_view_id,
        eventid as event_id,
        ticketid as registration_id,
        sessionid as session_id,
        email,
        viewedat as viewed_recording_at,
        _sdc_batched_at

    from source

)

select * from renamed