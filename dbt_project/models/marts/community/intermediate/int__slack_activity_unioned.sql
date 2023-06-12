
-- WARN: no explicit tie-breaking system for partitions, so data is to that degree variable
-- excludes private channels

with

messages as (

    select * from {{ ref('stg_slack__messages') }}
    where channel_name is not null

),

reactions as (

    select * from {{ ref('stg_slack__reactions') }}
    where channel_name is not null

),

final as (

    select
        channel_id,
        message_id,
        user_id,
        day_sent_at as day,
        week_sent_at as week,
        'thread' as message_type
        
    from messages
    where is_post = True

    union all

    select
        channel_id,
        message_id,
        user_id,
        day_sent_at as day,
        week_sent_at as week,
        'message' as message_type

    from messages
    where is_actual_message = True

    union all

    select
        channel_id,
        message_id,
        user_id,
        day_sent_at as day,
        week_sent_at as week,
        'reply' as message_type

    from messages
    where is_reply

    union all

    select
        channel_id,
        reaction_id as message_id,
        user_id,
        day_sent_at as day,
        week_sent_at as week,
        'reaction' as message_type
        
    from reactions

)

select * from final