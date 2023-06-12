with source as (

    select * from raw.youtube_analytics.channels

),

filtered as (

    select
        id as channel_id,
        _sdc_batched_at::date as date_day,
        etag,

        snippet:title::varchar as channel_title,
        snippet:description::varchar as channel_description,
        status:privacy_status::varchar as privacy_status,

        statistics:subscriber_count::int as count_subscribers,
        statistics:video_count::int as count_videos,
        statistics:view_count::int as count_views,

        row_number() over (
            partition by id
            order by _sdc_batched_at desc
        ) = 1 as is_most_recent,

        published_at as channel_published_at

    from source
    qualify row_number() over (
        partition by channel_id, date_day
        order by _sdc_batched_at desc) = 1
        --since data is loaded every hour,
        --we are pulling by the latest batch time
        --to get the latest version of the channel
),

with_id as (

    select
        md5(cast(coalesce(cast(channel_id as TEXT), '') || '-' || coalesce(cast(date_day as TEXT), '') as TEXT)) as id,
        *
    
    from filtered
)

select * from with_id