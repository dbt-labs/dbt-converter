with

source as (

    select * from {{ source('meetup', 'groups') }}

),

renamed as (

    select
        id as group_id,

    --Group Info
        name as group_name,
        description as group_description,
        status as group_status,
        organizers,
        urlname as url_name,
        topics,
        categories,
        upcoming_events,

    --Geo Info
        country,
        state,
        city,
        lat,
        lon,

    --Metrics
        member_count,
        average_age,
        gender_female as gender_female_pct,
        gender_male as gender_male_pct,
        gender_other as gender_other_pct,
        gender_unknown as gender_unknown_pct,
        past_events,
        past_rsvps,
        repeat_rsvpers,
        rsvps_per_event,

    --Date Info
        (founded_date::integer/1000)::timestamp_ntz as founded_at,
        (last_event::integer/1000)::timestamp_ntz as last_event_at

    from source

)

select * from renamed