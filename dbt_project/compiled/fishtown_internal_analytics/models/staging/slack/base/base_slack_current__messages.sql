with source as (

    select * from raw.slack.messages

),

renamed as (

    select
        md5(cast(coalesce(cast(ts as TEXT), '') || '-' || coalesce(cast(channel_id as TEXT), '') as TEXT)) as message_id,

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
        
    dateadd(seconds, ts, '1970-01-01')
 as sent_at,
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