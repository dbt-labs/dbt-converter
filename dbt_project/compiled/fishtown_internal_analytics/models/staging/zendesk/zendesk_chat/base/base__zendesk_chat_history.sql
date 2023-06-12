with 

source as (
    
    select * from raw.fivetran_zendesk_chat.chat_history

),

ordered as (

    select
        chat_id,
        name,
        row_number() over (partition by chat_id order by timestamp) as chat_message_number
    from source
    where type='chat.msg'
),

requestor as (

    select chat_id, name
    from ordered
    where chat_message_number = 1

),

renamed as (
    
    select
        md5(cast(coalesce(cast(source.chat_id as TEXT), '') || '-' || coalesce(cast(source.name as TEXT), '') || '-' || coalesce(cast(source.timestamp as TEXT), '') as TEXT)) as chat_history_id,
        source.chat_id,
        source.channel,
        source.type as chat_event_type,
        source.name as user_name,
        source.msg,
        source.timestamp as created_at_utc,

        convert_timezone(
            'UTC',
            'America/New_York',
            source.timestamp::timestamp_ntz
        )::timestamp_ntz as created_at,
        requestor.name is not null as is_requestor

    from source

    left join requestor
    on source.chat_id = requestor.chat_id
        and source.name = requestor.name

)


select * from renamed