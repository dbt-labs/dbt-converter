with messages as (

    select * from {{ ref('base_slack_current__messages') }}

),

flattened as (

    select
        message_id as parent_message_id,
        channel_id,
        value:user::text as user_id,
        user_id as parent_user_id,
        value:text::text as text,
        value:reactions as reactions,
        value:type::text as type,
        value:subtype::text as subtype,
        value:ts::decimal(18,6) as ts,
        value:thread_ts::decimal(18,6) as thread_ts

    from messages, lateral flatten (input=>threaded_replies)

    -- the first reply is the actual message, so exclude it
    where index != 0

),

renamed as (

    select
        -- ids
        {{ dbt_utils.generate_surrogate_key([
            'ts',
            'channel_id'
        ]) }} as message_id,

        parent_message_id,
        channel_id,
        user_id,
        parent_user_id,

        {{ epoch_to_timestamp('ts') }} as sent_at,
        {{ epoch_to_timestamp('thread_ts') }} as parent_message_sent_at,
        
        type,
        subtype,
        text,
        reactions,
        'current_flattened' as _dbt_source

    from flattened

)

select * from renamed
