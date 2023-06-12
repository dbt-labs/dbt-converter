{% docs fct_slack_user_activity %}

This model helps BI users calculate daily, weekly, and monthly active user metrics on top of our Slack usage data. 
Users are considered active if they either a) post a new thread, b) reply to an existing thread, or c) "react" (emoji) a post.

{% enddocs %}

{% docs fct_twitter_engagement %}

This model looks at Twitter engagement metrics (e.g. likes, replies, retweets, quote tweets) on Tweets that contain hashtags which we track.
To view the hashtags we currently track, please view the Twitter Source dbt docs.

{% enddocs %}

{% docs fct_youtube_channel_activity %}
This model is daily view of our YouTube channel ([see dbt YouTube channel](https://www.youtube.com/c/dbt-labs)), segmented by the country of the subscribers/unsubscribers.

**NOTE:** We began replicating YouTube data on 2021 July 4. Because of this, we had to backfill previous dates with the estimated subscriber counts. Any dates prior to 2021-07-04 will be an evenly distributed number from the estimated subscribers between our channel's published date to when we began replicating data. You can view which dates have estimated metrics via the `is_estimate` flag.

{% enddocs %}

{% docs fct_youtube_video_activity %}
This model is daily view of a YouTube video, segmented by country of the viewers, whether they were watching live or on-demand (i.e. watching the video after it was posted), and if they were subscribed to our YouTube channel or not.

**NOTE:** We began replicating YouTube data on 2021 July 4. Because of this, we had to backfill previous dates with estimated video metrics. Any dates prior to 2021-07-04 will be an evenly distributed number from the estimated video metrics between our channel's published date to when we began replicating data. You can view which dates have estimated metrics via the `is_estimate` flag.
{% enddocs %}


{% docs fct_youtube_video_daily %}
This model contains both daily and lifetime statistics for each YouTube video. If you want to pull the most recent lifetime totals for video metrics, you should filter by `is_most_recent = true`. Metrics labeled `new` can be used to measure daily performance (see note).

 **NOTE:** Aggregating `new` metrics will not equal lifetime totals for videos posted before 12/3/2021. This is because of API limitations that do not allow us to pull historical data, and this was the date the connection was made.
{% enddocs %}

{% docs fct_youtube_channel_daily %}
This model contains both daily and lifetime statistics for each YouTube channel. If you want to pull the most recent lifetime totals for channel metrics, you should filter by `is_most_recent = true`. Metrics labeled `new` can be used to measure daily performance (see note).

**NOTE**: Aggregating `new` metrics will not equal lifetime totals a channel before 11/23/2021. This is because of API limitations that do not allow us to pull historical data, and this was the date the connection was made. In addition, YouTube rounds subscriber counts to 3 significant figures - this means that if our actual subscriber count is 12,345 then it will show as 12,300. As a result, daily change of subscribers is accurate, though trends are still considered directional.
{% enddocs %}