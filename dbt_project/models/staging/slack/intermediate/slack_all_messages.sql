{% set columns_to_select=[
    'message_id',
    'parent_message_id',
    'channel_id',
    'user_id',
    'parent_user_id',
    'sent_at',
    'parent_message_sent_at',
    'type',
    'subtype',
    'text',
    'reactions',
    '_dbt_source'
] %}

{% set columns_to_select_csv=columns_to_select | join (", ") %}


with current_posts as (

    select * from {{ ref('base_slack_current__messages') }}

),

current_replies as (

    select * from {{ ref('slack_current__flattened_replies') }}

),

historical_messages as (

    select * from {{ ref('historical_messages_with_channel_id') }}

),

-- subthreads appear as both posts and replies -- get 'em outta 'ere
current_non_replies as (

    select * from current_posts

    where subtype not in ('thread_broadcast') or subtype is null

),


current_all as (

    select {{ columns_to_select_csv }} from current_non_replies

    union all

    select {{ columns_to_select_csv }} from current_replies

),

-- find the hisorical messages that don't overlap with the current result set
historical_non_overlapping as (

    select {{ columns_to_select_csv }} from historical_messages

    -- use this where condition to exclude any overlap between the two sources
    where message_id not in (select message_id from current_all)

),

-- union them all together
all_time as (

    select * from current_all

    union all

    select * from historical_non_overlapping

)

select * from all_time
