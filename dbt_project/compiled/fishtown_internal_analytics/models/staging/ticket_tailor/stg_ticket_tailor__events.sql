with source as (

    select * from raw.taptickettailor.events

),

renamed as (

    select
        -- keys
        id as event_id,

        -- descriptions
        name,
        description,
        object,
        payment_methods,
        images,
        ticket_types,
        currency,
        timezone,
        url,
        venue,
        call_to_action,

        case
            when name ilike '%coalesce%'
                then false
            else true
        end as is_learn_event,

        -- status
        status,
        total_issued_tickets,
        total_orders,

        -- booleans
        online_event::boolean as is_online_event,
        private::boolean as is_private,
        tickets_available::boolean as has_tickets_available,

        -- timestamps
        to_timestamp_ntz(created_at) as created_at,
        "START":date::date as event_start_date,
        "END":date::date as event_end_date,

        -- metadata
        _sdc_batched_at,
        _sdc_received_at,
        _sdc_sequence,
        _sdc_table_version

        -- ignored
        -- 'end',
        -- 'start'
        -- ticket_groups

    from source

)

select * from renamed