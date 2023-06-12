with

tweets as (

    select * from {{ ref('stg_twitter__tweets') }}

),

users as (

    select * from {{ ref('stg_twitter__users') }}

),

joined as (

    select
        tweets.*,
        users.twitter_name as author_name,
        users.twitter_username as author_username,
        users.location as author_location
    from tweets
    left join users
        on tweets.author_id = users.twitter_user_id
    where tweet not ilike 'RT @%'

)

select * from joined