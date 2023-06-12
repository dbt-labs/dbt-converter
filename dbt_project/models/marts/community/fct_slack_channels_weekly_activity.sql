with

unioned as (

    select * from {{ ref('int__slack_activity_unioned') }}

),

aggregates as (

    select
        channel_id,
        week,
        coalesce(count(iff(message_type='thread',message_id,null)),0) as total_thread_count,
        coalesce(count(iff(message_type='message',message_id,null)),0) as total_message_count,
        coalesce(count(iff(message_type='reaction',message_id,null)),0) as total_reaction_count,
        coalesce(count(distinct(iff(message_type='message',user_id,null))),0) as msg_author_count,
        coalesce(count(distinct(iff(message_type='reaction',user_id,null))),0) as reaction_author_count,
        coalesce(count(distinct user_id),0) as weekly_active_members
    from unioned
    group by 1,2

),

final as (
    select
        {{dbt_utils.generate_surrogate_key([
            'channel_id',
            'week'
            ])}} as id, 
        channel_id,
        week,
        total_thread_count,
        total_message_count,
        total_reaction_count,
        msg_author_count,
        reaction_author_count,
        weekly_active_members

    from aggregates
)

select * from final