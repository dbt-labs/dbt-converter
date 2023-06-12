with source as (

    select * from {{ source('stitch_youtube', 'videos') }}

),

live_videos as (

    select
        id,
        snippet:live_broadcast_content::string like any ('live','upcoming') as was_live_video
    
    from source 
    qualify row_number() over (
        partition by id
        order by _sdc_batched_at asc) = 1
        
),

filtered as (

    select
        id as video_id,
        _sdc_batched_at::date as date_day,
        snippet:channel_id::varchar as channel_id,
        snippet:category_id::varchar as category_id,
        etag,

        snippet:title::varchar as video_title,
        snippet:description::varchar as video_description,
        snippet:channel_title::varchar as channel_title,
        snippet:thumbnails::varchar as thumbnails,
        snippet:live_broadcast_content::string as live_broadcast_content,
        was_live_video,

        content_details:duration::varchar as video_duration,
        content_details:caption::boolean as has_captions,
        
        status:embeddable::boolean as is_embeddable,
        status:privacy_status::varchar as privacy_type,

        statistics:comment_count::int as count_comments,
        statistics:favorite_count::int as count_favorites,
        statistics:like_count::int as count_likes,
        statistics:view_count::int as count_views,

        row_number() over (
            partition by video_id
            order by _sdc_batched_at desc
        ) = 1 as is_most_recent,

        published_at as video_published_at

    from source
    left join live_videos using (id)
    qualify row_number() over (
        partition by id, _sdc_batched_at::date
        order by _sdc_batched_at desc) = 1
     --context: we replicate YouTube videos incrementally,
     --because of this we want to take the last batched row
     --on a given day

),

with_id as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'video_id',
            'date_day'
        ])}} as id,
        *
    
    from filtered

)

select * from with_id
