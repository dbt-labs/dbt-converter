with source as (

    select * from {{ source('heysummit', 'tickets') }}

),

renamed as (

    select

        id as ticket_id,
        event_id,
        name,
        event_name,
        url,
        created_at

    from source

)

select * from renamed