with

slack_users as (

    select * from {{ ref('base__slack_users') }}

),

timezone_to_region as (

    select * from {{ ref('stg_seed__timezone_to_region') }}

),

joined as (

    select
        slack_users.*,
        timezone_to_region.region_category,
        timezone_to_region.country_name,
        timezone_to_region.country_code
    from slack_users
    left join timezone_to_region using (timezone)

)

select * from joined