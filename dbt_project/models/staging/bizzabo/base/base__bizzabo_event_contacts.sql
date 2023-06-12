with

source as (

    select * from {{ source('bizzabo', 'event_contacts') }}

),

renamed as (

    select
        id as contact_id,
        eventid as event_id,
        parse_json(properties) as properties,
        created as created_at,
        modified as modified_at,
        _sdc_batched_at

    from source

)

select * from renamed