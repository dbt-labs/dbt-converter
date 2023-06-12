with source as (

    select * from raw.fivetran_hubspot.contact_form_submission

),

renamed as (

    select
        conversion_id,
        contact_id,
        form_id,
        portal_id,
        title,
        page_url,
        parse_url(page_url):parameters:utm_medium::string as marketing_medium,
        parse_url(page_url):parameters:utm_source::string as marketing_source,
        parse_url(page_url):parameters:utm_campaign::string as marketing_campaign,
        parse_url(page_url):parameters:utm_content::string as marketing_content,
        timestamp as form_submitted_at

    from source

),

parse_marketing_dimensions as (

    select
        *,
        
    
        case 
            when len(marketing_campaign) - len(replace(marketing_campaign, '_', '')) > 1 then lower(split_part(marketing_campaign, '_', 1))
        end as marketing_campaign_period,

        case
            when len(marketing_campaign) - len(replace(marketing_campaign, '_', '')) > 1 then lower(split_part(marketing_campaign, '_', 2))
            else lower(marketing_campaign)
        end as marketing_campaign_name,

        case
            when len(marketing_campaign) - len(replace(marketing_campaign, '_', '')) > 1 then lower(split_part(marketing_campaign, '_', 3))
        end as marketing_campaign_goal,

        case
            when len(marketing_content) - len(replace(marketing_content, '_', '')) > 1 then lower(split_part(marketing_content, '_', 1))
        end as marketing_offer,

        case
            when len(marketing_content) - len(replace(marketing_content, '_', '')) > 1 then lower(split_part(marketing_content, '_', 2))
            else lower(marketing_content)
        end as marketing_asset,

        case
            when len(marketing_content) - len(replace(marketing_content, '_', '')) > 1 then lower(split_part(marketing_content, '_', 3))
        end as marketing_asset_version



    from renamed

)

select * from parse_marketing_dimensions