{%- set metrics = [
    'retweet_count',
    'reply_count',
    'like_count',
    'quote_count'
    ]
    -%}

with

source as (

    select * from {{ source('twitter', 'tweets') }}

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
         ) as twitter_metrics,

    {%- for metric in metrics -%}

        split_part(
            split_part(
                twitter_metrics,
                '{{ metric }}:',
                -1
            ),
            ',',
            1
        )::int as {{metric}},

    {%- endfor -%}

        created_at

    from source

)

select * from renamed