{{
  config(
    materialized = 'table'
  )
}}

with

messages as (

    select * from {{ ref('stg_slack__messages') }}

),

per_message_per_emoji as (

    select
        messages.message_id,
        messages.channel_id,
        messages.channel_name,
        messages.sent_at as message_sent_at,
        value:name::text as reaction,
        value:users as users

    from messages, lateral flatten (input=>reactions)

),

per_message_per_emoji_per_user as (

    select
        message_id,
        channel_id,
        channel_name,
        message_sent_at,
        date_trunc('day', message_sent_at) as day_sent_at,
        date_trunc('week', message_sent_at) as week_sent_at,
        date_trunc('month', message_sent_at) as month_sent_at,
        reaction,
        index,
        value::string as user_id

    from per_message_per_emoji, lateral flatten (input=> users)

),

final as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'message_id',
            'reaction',
            'user_id'
        ]) }} as reaction_id,
        *

    from per_message_per_emoji_per_user

)

select * from final
