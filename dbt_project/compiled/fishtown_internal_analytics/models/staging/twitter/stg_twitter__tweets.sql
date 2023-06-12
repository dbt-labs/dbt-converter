with

source as (

    select * from raw.twitter_search.tweets

),

renamed as (

    select
        id as tweet_id,
        author_id,
        conversation_id,
        lang as language,
        text as tweet,

        regexp_replace(
            replace(public_metrics, ''''),
            '{|}'
         ) as twitter_metrics,split_part(
            split_part(
                twitter_metrics,
                'retweet_count:',
                -1
            ),
            ',',
            1
        )::int as retweet_count,split_part(
            split_part(
                twitter_metrics,
                'reply_count:',
                -1
            ),
            ',',
            1
        )::int as reply_count,split_part(
            split_part(
                twitter_metrics,
                'like_count:',
                -1
            ),
            ',',
            1
        )::int as like_count,split_part(
            split_part(
                twitter_metrics,
                'quote_count:',
                -1
            ),
            ',',
            1
        )::int as quote_count,created_at

    from source

)

select * from renamed