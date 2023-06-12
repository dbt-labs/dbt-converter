with messages as (

    select * from {{ ref('fct_slack_messages') }}

),

replies as (

    select * from {{ ref('fct_slack_replies') }}

),

post_replies as (

    select
        parent_message_id,
        count(*) as number_of_replies,
        min(sent_at) as first_reply_at,
        boolor_agg(is_self_reply) as has_self_reply

    from replies

    group by 1

),

posts as (

    select
        message_id,
        channel_id,
        channel_name,
        user_id,
        text,
        reactions,
        number_of_reactions,
        sent_at

    from messages

    where is_post

),

joined as (

    select
        posts.message_id,
        posts.channel_id,
        posts.channel_name,
        posts.user_id,
        posts.text,
        posts.reactions,
        posts.sent_at,
        coalesce(post_replies.number_of_replies, 0) as number_of_replies,
        coalesce(post_replies.number_of_replies, 0) > 0 as has_replies,
        post_replies.first_reply_at,
        datediff('minute', posts.sent_at, post_replies.first_reply_at) as minutes_to_first_reply,
        post_replies.has_self_reply

    from posts

    left join post_replies
        on posts.message_id = post_replies.parent_message_id

)

select * from joined
