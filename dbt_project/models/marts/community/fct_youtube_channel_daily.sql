with

channels as (

    select * from {{ ref('stg_youtube__channels') }}

),

-- The below window functions allow us to calculate day-over-day change, which in turn provides daily metrics
windowed as (

    select
        *,

        count_subscribers - lag(count_subscribers) over (
            partition by channel_id
            order by date_day
            ) as count_new_subscribers,

        count_videos - lag(count_videos) over (
            partition by channel_id
            order by date_day
            ) as count_new_videos,

        count_views - lag(count_views) over (
            partition by channel_id 
            order by date_day
            ) as count_new_views
    
    from channels

)

select * from windowed
