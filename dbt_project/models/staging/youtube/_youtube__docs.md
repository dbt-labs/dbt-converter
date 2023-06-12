{% docs src_youtube %}

**Status:** Active

We replicate YouTube data from our [dbt YouTube channel](https://www.youtube.com/c/dbt-labs) via two methods:
1. Fivetran -- from their YouTube Analytics connector. This brings in daily metrics on a video / channel. However, they do not give us metadata on the video or channel.
2. Stitch -- from a custom Singer tap ([see tap-youtube-analytics repo](https://github.com/singer-io/tap-youtube-analytics)). Via this tap, we use the YouTube Data API to extract Channel, Video, and Playlist metadata (e.g. titles, descriptions, when they were created).
{% enddocs %}

{% docs stg_youtube__activity %}
We create this model via Fivetran's YouTube Analytics connector. This staging model gives you video/subscriber statistics per Video and Channel on a daily level, but with segmentations on: country, whether it was viewed Live or On-Demand, and if the viewer was subscribed.
{% enddocs %}

{% docs stg_youtube__videos %}
This model contains the metadata information for each YouTube video, as well as the lifetime stats for each video pulled daily. If you want to pull the most recent lifetime totals for video metrics, you should filter by `is_most_recent = true`.
{% enddocs %}

{% docs stg_youtube__channels %}
This model contains the metadata information for each YouTube channel, as well as the lifetime stats for each channel pulled daily. If you want to pull the most recent lifetime totals for channel metrics, you should filter by `is_most_recent = true`.
{% enddocs %}

{% docs etag %}
Indicates when the object has changed ([see Youtube Data API docs on etags](https://developers.google.com/youtube/v3/getting-started#etags)). This is a cache where folks can utilize a point in history when the object was in that given state.
{% enddocs %}

{% docs viewer_country_code %}
The country of the viewers or subscribers that are watching a given YouTube video or subscribing to the YouTube channel.
{% enddocs %}

{% docs viewer_region_category %}
The region of the viewers or subscribers that are watching a given YouTube video or subscribing to the YouTube channel. This is determined by our country code to region mapping.
{% enddocs %}

{% docs live_or_on_demand %}
Indicates whether the viewer watched this Live or On-Demand (i.e. streaming it after it's been posted to our channel).
{% enddocs %}

{% docs subscribed_status %}
Indicates whether the viewer who watched this was subscribed or not.
{% enddocs %}

{% docs count_subscribers_gained %}
The total subscribers that day that were gained on a given calendar.
{% enddocs %}

{% docs count_subscribers_lost %}
The total subscribers that day that were lost on a given calendar.
{% enddocs %}

{% docs count_subscribers_net %}
The total net subscribers (count_subscribers_gained - count_subscribers_lost) at the end of the day.
{% enddocs %}

{% docs video_id %}
Boolean to indicate whether the metrics on the given calendar date are estimated. Please view the model's docs to understand why we have this boolean.
{% enddocs %}

{% docs date_day %}
The date the video was viewed
{% enddocs %}

{% docs channel_id %}
Unique identifier of the video channel
{% enddocs %}

{% docs video_title %}
Title of the video
{% enddocs %}

{% docs video_description %}
Description of the video
{% enddocs %}

{% docs channel_description %}
Description of the channel
{% enddocs %}

{% docs channel_title %}
Title of the channel
{% enddocs %}

{% docs thumbnails %}
A JSON object with URLs for the different thumbnail sizes
{% enddocs %}

{% docs live_broadcast_content %}
Indicates if the video is an upcoming/active live broadcast. Or it's "none" if the video is not an upcoming/active live broadcast.
{% enddocs %}

{% docs video_duration %}
The length of the video. The property value is an ISO 8601 duration.
{% enddocs %}

{% docs privacy_type %}
The video's privacy status. The model includes only public videos.
{% enddocs %}

{% docs has_captions %}
Indicates whether captions are available for the video.
{% enddocs %}

{% docs is_embeddable %}
Indicates whether the video can be embedded on another website.
{% enddocs %}

{% docs was_live_video %}
Indicates whether a video was broadcasted live.
{% enddocs %}

{% docs video_published_at %}
Timestamp of when the video was published
{% enddocs %}

{% docs count_views %}
Total number of views the video received
{% enddocs %}

{% docs count_comments %}
Total number of comment posted on the video
{% enddocs %}

{% docs count_likes %}
Total number of likes attributed to the video
{% enddocs %}

{% docs count_dislikes %}
Total number of dislikes attributed to the video
{% enddocs %}

{% docs count_shares %}
Total number of times the video was shared
{% enddocs %}

{% docs total_watch_time_min %}
Total watch time in minutes the video received
{% enddocs %}

{% docs average_view_duration_percentage %}
Average duration of views represented as a percent of the entire length of the video
{% enddocs %}

{% docs average_view_duration_seconds %}
Average duration of views for the video in seconds
{% enddocs %}