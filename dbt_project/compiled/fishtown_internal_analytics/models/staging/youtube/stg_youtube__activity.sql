with

source as (

    select * from raw.fivetran_youtube.channel_basic

),

renamed as (

    select

        date as date_day,
        channel_id,
        nullif(video_id, '') as video_id,

        country_code as viewer_country_code,
        subscribed_status,
        live_or_on_demand,

    --CHANNEL METRICS
        subscribers_gained as count_subscribers_gained,
        subscribers_lost as count_subscribers_lost,
        (subscribers_gained - subscribers_lost) as count_subscribers_net,

    --VIDEO METRICS
        views as count_views,
        comments as count_comments,
        likes as count_likes,
        dislikes as count_dislikes,
        shares as count_shares,
        watch_time_minutes::int as total_watch_time_min,

        videos_added_to_playlists,
        videos_removed_from_playlists,
        average_view_duration_seconds,
        average_view_duration_percentage / 100 as average_view_duration_percentage,

        annotation_click_through_rate,
        annotation_close_rate,
        annotation_impressions,
        annotation_clickable_impressions,
        annotation_closable_impressions,
        annotation_clicks,
        annotation_closes,

        card_click_rate,
        card_teaser_click_rate,
        card_impressions,
        card_teaser_impressions,
        card_clicks,
        card_teaser_clicks

    from source

),

with_id as (

    select
        md5(cast(coalesce(cast(date_day as TEXT), '') || '-' || coalesce(cast(channel_id as TEXT), '') || '-' || coalesce(cast(video_id as TEXT), '') || '-' || coalesce(cast(viewer_country_code as TEXT), '') || '-' || coalesce(cast(live_or_on_demand as TEXT), '') || '-' || coalesce(cast(subscribed_status as TEXT), '') as TEXT)) as id,
        *

    from renamed

)

select * from with_id