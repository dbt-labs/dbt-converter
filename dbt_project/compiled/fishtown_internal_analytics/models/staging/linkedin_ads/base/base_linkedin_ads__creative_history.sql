with

source as (

    select * from raw.fivetran_linkedin_ads.creative_history

),

urls_expanded as (

    select
        *,

        -- sponsored update, video, and carousel ad types don't contain a `click_uri` value
        -- therefore, we need to extract this from the entities field via the Landing Page Url
        sponsored_update_share_content_content_entities[0]:landingPageUrl::string as sponsored_status_update_uri,
        sponsored_video_user_generated_content_post_value_specific_content_share_content_media[0]:landingPageUrl::string as sponsored_video_uri,
        sponsored_update_carousel_share_content_content_entities[0]:landingPageUrl::string as sponsored_update_carousel_uri

    from source

),

coalesced as (

    select
        * exclude (click_uri),
        case
            when startswith(reference,'urn:li:share')
                then split_part(reference,':',4)
        end as share_id,

        -- this ensures every ad type has a Click URI - because these are mutually exclusive, the Coalesce function will work here
        coalesce(
            sponsored_status_update_uri,
            sponsored_video_uri,
            sponsored_update_carousel_uri,
            click_uri
        ) as click_uri
    
    from urls_expanded
)

select * from coalesced