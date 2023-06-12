-- note to self: should we rename this channel events? the name is non intuitive
-- since it includes channel joins

{{
  config(
    materialized = "table"
  )
}}

with messages as (

    select * from {{ ref('slack_all_messages') }}

),

channels as (

    select * from {{ ref('stg_slack__channels') }}

),

joined as (

    select
        messages.message_id,
        messages.parent_message_id,
        messages.channel_id,
        channels.name as channel_name,
        messages.user_id,
        messages.parent_user_id,
        messages.sent_at,
        date_trunc('day', messages.sent_at) as day_sent_at,
        date_trunc('week', messages.sent_at) as week_sent_at,
        date_trunc('month', messages.sent_at) as month_sent_at,
        messages.parent_message_sent_at,
        messages.type,
        messages.subtype,

        (messages.subtype is null
            or messages.subtype in ('thread_broadcast')
        ) as is_actual_message,

        -- note that thread_broadcasts are not included as posts even though they
        -- are sent to channels
        (is_actual_message and messages.parent_message_id is null) as is_post,

        (is_actual_message and messages.parent_message_id is not null) as is_reply,

        messages.text,
        length(messages.text) as text_length,
        messages.reactions,
        messages._dbt_source

    from messages

    left join channels
        on messages.channel_id = channels.channel_id

)

select * from joined
