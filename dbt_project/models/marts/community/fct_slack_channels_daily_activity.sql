with

unioned as (

    select * from {{ ref('int__slack_activity_unioned') }}

),

aggregates as (

    select
        channel_id,
        user_id,
        day,
        coalesce(count(iff(message_type='thread',message_id,null)),0) as total_thread_count,
        coalesce(count(iff(message_type='reply',message_id,null)),0) as total_reply_count,
        coalesce(count(iff(message_type='message',message_id,null)),0) as total_message_count,
        coalesce(count(iff(message_type='reaction',message_id,null)),0) as total_reaction_count
    from unioned
    group by 1,2,3

),

final as (
    select
        {{dbt_utils.generate_surrogate_key([
            'channel_id',
            'user_id',
            'day'
            ])}} as id, 
        channel_id,
        user_id,
        day,
        total_thread_count,
        total_reply_count,
        total_message_count,
        total_reaction_count

    from aggregates
)

select * from final