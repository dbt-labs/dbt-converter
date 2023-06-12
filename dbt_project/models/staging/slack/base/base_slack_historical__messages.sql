with source as (

    select * from {{ source('slack_historical', 'messages') }}

),

-- do this part in a CTE so these fields can be easily used in logic below
recast as (

    select
        {{ epoch_to_timestamp('ts') }} as sent_at,
        {{ epoch_to_timestamp('thread_ts') }} as parent_message_sent_at,
        *

    from source

),

cleaned as (

    select
        channel as channel_name,
        user as user_id,

        -- sometimes when a message is the start of a thread, the thread_ts
        -- column has the same value as the ts column. Since this can be confusing,
        -- replace it with a NULL here.
        case
            when sent_at = parent_message_sent_at
                then null
            else parent_user_id
        end as parent_user_id,

        sent_at,

        -- same idea as above, but simpler
        nullif(parent_message_sent_at, sent_at) as parent_message_sent_at,

        ts,
        thread_ts,

        type,
        subtype,
        text,
        reactions,
        replies,
        reply_users,
        reply_users_count,
        item_type,
        user_profile,
        upload,
        hidden,
        user_team,
        edited,
        latest_reply,
        icons,
        old_name,
        source_team,
        display_as_bot,
        files,
        comment,
        last_read,
        topic,
        bot_id,
        name,
        upload_reply_to,
        inviter,
        is_intro,
        team,
        attachments,
        username,
        x_files,
        reply_count,
        subscribed,
        root,
        purpose,
        file,
        bot_link,
        'historical' as _dbt_source

    from recast

)

select * from cleaned
