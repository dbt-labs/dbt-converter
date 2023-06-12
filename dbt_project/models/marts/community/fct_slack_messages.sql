with messages as (

    select * from {{ ref('stg_slack__messages') }}

),

reactions as (

    select * from {{ ref('stg_slack__reactions') }}

),

message_reactions as (

    select
        message_id,
        count(*) as number_of_reactions

    from reactions

    group by 1

),

joined as (

    select
        messages.message_id,
        messages.parent_message_id,
        messages.channel_id,
        messages.channel_name,
        messages.user_id,
        messages.parent_user_id,
        messages.text,
        messages.text_length,
        messages.reactions,
        message_reactions.number_of_reactions,
        messages.is_post,
        messages.is_reply,
        messages.sent_at,
        messages.parent_message_sent_at

    from messages

    left join message_reactions using (message_id)

    where messages.is_actual_message

)

select * from joined
