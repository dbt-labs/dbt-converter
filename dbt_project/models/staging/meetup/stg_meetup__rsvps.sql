with

source as (

    select * from {{ source('meetup', 'rsvps') }}

),

renamed as (

    select
        rsvp_id,
        event_id,
        group_id,
        member_id,
        status,
        (mtime/1000)::timestamp_ntz as signed_up_at

    from source

)

select * from renamed