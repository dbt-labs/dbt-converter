with

source as (

    select * from {{ source('meetup', 'events') }}

),

renamed as (

    select

        id as event_id,
        "GROUP":id::varchar as group_id,

        name as event_name,
        description as event_description,
        is_online_event,
        duration,
        link,
        status as event_status,
        how_to_find_us,

        venue:name::varchar as venue_name,
        venue:address_1::varchar as venue_address,
        venue:city::varchar as venue_city,
        venue:state::varchar as venue_state,
        venue:country::varchar as venue_country,

        venue as venue_json,
        "GROUP" as group_json,

        rsvp_limit,
        waitlist_count,
        yes_rsvp_count,
        visibility,

        utc_offset,
        local_time,
        local_date,
        (local_date || ' ' || local_time)::timestamp as local_timestamp,
        (time/1000)::timestamp_ntz as timestamp_at,
        (updated/1000)::timestamp_ntz as updated_at,
        (created/1000)::timestamp_ntz as created_at

    from source

)

select * from renamed