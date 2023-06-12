with messages as (

    select * from {{ ref('fct_slack_messages') }}

),

replies as (

    select
        message_id,
        parent_message_id,
        channel_id,
        channel_name,
        user_id,
        parent_user_id,
        parent_user_id = user_id as is_self_reply,
        text,
        reactions,
        number_of_reactions,
        sent_at,

        row_number() over (
            partition by parent_message_id
            order by sent_at
        ) = 1 as is_first_reply,

        row_number() over (
            partition by parent_message_id
            order by sent_at desc
        ) = 1 as is_final_reply

    from messages

    where is_reply

)

select * from replies
