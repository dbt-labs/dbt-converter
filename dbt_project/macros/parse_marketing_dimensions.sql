{% macro parse_marketing_dimensions() %}
    
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

{% endmacro %}