
{% set num_top_commenters = "100" %}
{% set num_top_reacted_to_users = "100" %}
{% set num_top_repliers = "100" %}

with

channels as (

    select * from {{ ref('stg_slack__channels') }}
    where not is_private

),

messages as (

    select * from {{ ref('stg_slack__messages') }}
    where channel_name is not null

),

reactions as (

    select * from {{ ref('stg_slack__reactions') }}

),

users as (

    select * from {{ ref('stg_slack__users') }}

),

-- metrics derived from message (post and reply) count
user_message_count_by_channel_by_month as (

    select
        channel_name,
        month_sent_at,
        user_id,
        count(*) as message_count

      from messages

      group by 1,2,3

 ),

monthly_top_commenters_by_channel as (

    select distinct
        {{dbt_utils.generate_surrogate_key([
            'channel_name',
            'month_sent_at',
            'user_id',
            '\'message_sent\''
            ])}} as id,
        channel_name,
        month_sent_at,
        user_id,
        'message_sent' as action_type,
        message_count as action_count,
        row_number() over(
            partition by channel_name, month_sent_at
            order by message_count desc
        ) as action_rank

    from user_message_count_by_channel_by_month

    qualify action_rank <= {{ num_top_commenters }}

),


-- metrics dervied from count of reactions received
user_reactions_count_by_channel_by_month as (

    select
        reactions.channel_name,
        messages.month_sent_at as month_msg_sent_at,
        messages.user_id as original_user_id,
        count(*) as reaction_count

      from reactions
          inner join messages
          on reactions.message_id = messages.message_id

      group by 1,2,3

 ),

monthly_top_reacted_to_users_by_channels as (

    select distinct
        {{dbt_utils.generate_surrogate_key([
            'channel_name',
            'month_msg_sent_at',
            'original_user_id',
            '\'reacted_to\''
            ])}} as id,
        channel_name,
        month_msg_sent_at,
        original_user_id,
        'reacted_to' as action_type,
        reaction_count as action_count,
        row_number() over(
            partition by channel_name, month_msg_sent_at
            order by reaction_count desc
        ) as action_rank

    from user_reactions_count_by_channel_by_month

    qualify action_rank <= {{ num_top_reacted_to_users }}

),

-- metrics derived from the number of replies written (but not channel-level posts)
reply_count as (

    select
        channel_name,
        month_sent_at,
        user_id,
        count(*) as reply_count

    from messages
    where is_reply
    group by 1,2,3

),

monthly_top_repliers_by_channel as (

    select distinct
        {{dbt_utils.generate_surrogate_key([
            'channel_name',
            'month_sent_at',
            'user_id',
            '\'replied\''
            ])}} as id,
        channel_name,
        month_sent_at,
        user_id,
        'replied' as action_type,
        reply_count as action_count,
        row_number() over(
            partition by channel_name, month_sent_at
            order by reply_count desc
        ) as action_rank

    from reply_count

    qualify action_rank <= {{ num_top_repliers }}

),

final as (

    select * from monthly_top_commenters_by_channel
    union all
    select * from monthly_top_reacted_to_users_by_channels
    union all
    select * from monthly_top_repliers_by_channel
)

select * from final
