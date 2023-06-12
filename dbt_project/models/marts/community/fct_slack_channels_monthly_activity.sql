
-- WARN: no explicit tie-breaking system for partitions, so data is to that degree variable
-- excludes special event channels and private ones

with

messages as (

    select * from {{ ref('stg_slack__messages') }}
    where channel_name is not null

),

monthly_channel_metrics as (

    select
        channel_id,
        month_sent_at,

        sum(case when is_post then 1 else null end) as total_thread_count,
        sum(case when is_actual_message then 1 else null end) as total_message_count,
        nullifzero(count(distinct case when is_actual_message then user_id else null end)) as msg_author_count

    from messages

    group by 1,2
),

final as (

    select
        {{dbt_utils.generate_surrogate_key([
            'channel_id',
            'month_sent_at'
            ])}} as id,
        monthly_channel_metrics.channel_id,
        monthly_channel_metrics.month_sent_at as month,

        monthly_channel_metrics.total_thread_count,
        100 * (
            total_thread_count / lag(total_thread_count, 1, 1) over (
                partition by channel_id
                order by month_sent_at
            ) - 1
        ) as total_thread_percent_change,

        monthly_channel_metrics.total_message_count,
        100 * (
            total_message_count / lag(total_message_count, 1, 1) over (
                partition by channel_id
                order by month_sent_at
            ) - 1
        ) as total_message_percent_change,

        monthly_channel_metrics.msg_author_count,
        100 * (
            msg_author_count / lag(msg_author_count, 1, 1) over (
                partition by channel_id
                order by month_sent_at
            ) - 1
        ) as msg_author_percent_change

    from monthly_channel_metrics

)

select * from final

