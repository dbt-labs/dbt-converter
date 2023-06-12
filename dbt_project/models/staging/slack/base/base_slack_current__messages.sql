with source as (

    select * from {{ source('slack', 'messages') }}

),

renamed as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'ts',
            'channel_id'
        ]) }} as message_id,

        null::string as parent_message_id,
        attachments,
        bot_id,
        channel_id,
        user as user_id,
        null::string as parent_user_id,
        client_msg_id,
        display_as_bot,
        edited,
        files,
        hidden,
        inviter,
        last_read,
        latest_reply,
        pinned_info,
        pinned_to,
        purpose,
        reactions,
        replies,
        reply_count,
        reply_users,
        reply_users_count,
        root,
        subscribed,
        subtype,
        team,
        text,
        topic,
        {{ epoch_to_timestamp('ts') }} as sent_at,
        null::timestamp as parent_message_sent_at,
        type,
        upload,
        username,
        _sdc_batched_at,
        _sdc_received_at,
        _sdc_sequence,
        _sdc_table_version,
        threaded_replies,
        'current' as _dbt_source

    from source

)

select * from renamed
