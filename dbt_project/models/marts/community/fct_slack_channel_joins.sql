with messages as (

    select * from {{ ref('stg_slack__messages') }}

),

channel_joins as (

    select
        message_id as channel_join_id,
        channel_id,
        channel_name,
        user_id,
        sent_at as joined_at

    from messages

    where subtype = 'channel_join'

)

select * from channel_joins
