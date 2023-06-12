with

posts as (

    select * from {{ ref('social_media_reporting__rollup_report') }}

),

-- Calendar events consist of HubSpot scheduled posts
-- This is how we plan to map organic social posts to a marketing campaign
calendar_events as (

    select * from {{ ref('stg_hubspot__calendar_events') }}
    where event_type = 'SOCIAL'

),

linkedin_shares as (

    select * from {{ ref('stg_linkedin_pages__shares') }}

),

hubspot_campaigns as (

    select * from {{ ref('stg_hubspot__marketing_campaigns') }}

),

hubspot_campaigns_grouped as (

    select distinct
        parent_campaign_id,
        parent_campaign_name
    
    from hubspot_campaigns

),

joined as (

    select

        calendar_events.parent_campaign_id,
        hubspot_campaigns_grouped.parent_campaign_name,
        posts.*
    
    from posts
    left join linkedin_shares
        on posts.post_id = linkedin_shares.share_id
    left join calendar_events
        -- we are utilizing separate join logic for LinkedIn since HubSpot uses the activity ID versus the Post ID
        on linkedin_shares.activity_id = calendar_events.post_id
        or posts.post_id = calendar_events.post_id
    left join hubspot_campaigns_grouped
        on calendar_events.parent_campaign_id = hubspot_campaigns_grouped.parent_campaign_id

)

select * from joined