with youtube_metrics as (

  select * from {{ ref('stg_youtube__activity') }}

),

video_info as (

  select * from {{ ref('stg_youtube__videos') }}
  where is_most_recent = true

),

channel_info as (

  select * from {{ ref('stg_youtube__channels') }}
  where is_most_recent = true

),

region_lookup as (

  select * from {{ ref('country_to_region_mappings') }}
  -- here we are forcing ISO-type countries since they are the most consistent
  where data_source = 'iso'

),

joined as (

    select
        youtube_metrics.id,
        youtube_metrics.date_day,
        youtube_metrics.channel_id,
        youtube_metrics.video_id,

        youtube_metrics.subscribed_status,
        youtube_metrics.live_or_on_demand,
        youtube_metrics.viewer_country_code,

        region_lookup.region_category as viewer_region_category,

        channel_info.channel_title,
        channel_info.channel_description,
        channel_info.channel_published_at,

        video_info.video_title,
        video_info.video_description,
        video_info.video_duration,
        video_info.privacy_type,

        video_info.has_captions,
        video_info.is_embeddable,
        video_info.was_live_video,
        video_info.video_published_at,

        youtube_metrics.count_views,
        youtube_metrics.count_comments,
        youtube_metrics.count_likes,
        youtube_metrics.count_dislikes,
        youtube_metrics.count_shares,
        youtube_metrics.total_watch_time_min,

        youtube_metrics.count_subscribers_gained,
        youtube_metrics.count_subscribers_lost,
        youtube_metrics.count_subscribers_net,

        youtube_metrics.average_view_duration_percentage, 
        youtube_metrics.average_view_duration_seconds

    from youtube_metrics
    inner join channel_info using (channel_id)
    inner join video_info using (video_id)
    left join region_lookup
        on youtube_metrics.viewer_country_code = region_lookup.country_code

)

select * from joined