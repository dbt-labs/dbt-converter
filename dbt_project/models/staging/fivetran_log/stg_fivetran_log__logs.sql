with source as (

    select * from {{ source('fivetran_log', 'log') }}

),

renamed as (

    select
        id as log_id,
        connector_id,
        transformation_id,
        event as event_type,
        message_event,
        parse_json(message_data) as message_data,
        sync_id,
        sequence_number,
        process_id,

        time_stamp as event_timestamp_at

    from source 

)

select * from renamed