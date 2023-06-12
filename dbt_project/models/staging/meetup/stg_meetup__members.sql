with

source as (

    select * from {{ source('meetup', 'members') }}

),

renamed as (

    select
        member_id,

    --Member Info
        member_name,
        email,
        role,
        is_organizer,

        case
            when email ilike any (
                '%fishtownanalytics.com', 
                '%dbtlabs.com')
                then true
            else false
        end as is_dbt_labs_employee,

        photo_thumb_url,
        can_receive_blast,
        chapters,
        events_attended,

    --Geo Info
        country,
        state,
        city,        
        lat,
        lon,

    --Timestamps
        (join_time/1000)::timestamp_ntz as joined_at,
        (last_access_time/1000)::timestamp_ntz as last_accessed_at

    from source

)

select * from renamed