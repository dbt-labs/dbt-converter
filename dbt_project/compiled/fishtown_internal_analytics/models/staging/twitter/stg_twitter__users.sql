with

source as (

    select * from raw.twitter_search.users

),

renamed as (

    select
        id as twitter_user_id,
        name as twitter_name,
        username as twitter_username,
        verified as is_twitter_verified,
        description,
        location

    from source

)

select * from renamed