{% docs organic_search_keywords %}

This model is used to measure our organic search keyword performance via Google Search Console. Using this data, we can understand which queries on Google search are leading users to our website properties. This model is enriched via our website content tags from the [dim_web_page_tags](#!/model/model.fishtown_internal_analytics.dim_web_page_tags) model.

**Important**  
Due to sampling from Google Search Console, this model should only be used if you are analyzing keyword performance. Rolling up measures from this model will not match the page or site performance reports. If you are analyzing data at the page or site level, please refer to the below models:
- Site performance: [stg_google_search_console__sites](#!/model/model.fishtown_internal_analytics.stg_google_search_console__sites)
- Page performance: [fct_organic_search_pages](#!/model/model.fishtown_internal_analytics.fct_organic_search_pages)

For more information on how Google Search Console aggregates & samples data, visit [Google's Guide to Search Performance Reports](https://support.google.com/webmasters/answer/7576553).

{% enddocs %}

{% docs organic_search_pages %}

This model is used to measure our page performance via Google Search Console. Using this data, we can understand which pages from our website properties are appearing in Google search queries. This model is enriched via our website content tags from the [dim_web_page_tags](#!/model/model.fishtown_internal_analytics.dim_web_page_tags) model.

**Important**  
Due to sampling from Google Search Console, this model should only be used if you are analyzing page performance. Rolling up measures from this model will not match the keyword or site performance reports. If you are analyzing data at the keyword or site level, please refer to the below models:
- Site performance: [stg_google_search_console__sites](#!/model/model.fishtown_internal_analytics.stg_google_search_console__sites)
- Keyword performance: [fct_organic_search_keywords](#!/model/model.fishtown_internal_analytics.fct_organic_search_keywords)

For more information on how Google Search Console aggregates & samples data, visit [Google's Guide to Search Performance Reports](https://support.google.com/webmasters/answer/7576553).

{% enddocs %}

{% docs organic_social_posts %}

This model contains one row per social media post across dbt Labs' LinkedIn and Twitter social media accounts. This includes:
- [@dbt_labs on Twitter](https://twitter.com/dbt_labs)
- [@getdbt on Twitter](https://twitter.com/getdbt)
- [@coalesceconf on Twitter](https://twitter.com/coalesceconf)
- [dbt Labs company page on LinkedIn](https://www.linkedin.com/company/dbtlabs)

This data is loaded via Fivetran and is synced every 3 hours. The models that make up this dataset are largely created via [Fivetran's Social Media Reporting package](https://hub.getdbt.com/fivetran/social_media_reporting/latest/). Additional models are used to align social media posts with HubSpot campaigns via the Calendar Event object.

{% enddocs %}

{% docs fct_campaign_members %}
## Overview
This model contains all members within a Salesforce marketing campaign, as well as their associated touchpoint, opportunity, and dbt Cloud user information. Since this model contains a combination of Salesforce and dbt Cloud information, relevant models from those sources can be joined to this model to enrich analysis.

**Below are some crucial concepts needed to understand how this model is built:**
- Salesforce acts as the base for our campaign reporting. We have operational processes setup to ensure that anyone who interacts with a campaign is sent to the respective Salesforce campaign. This ensures we have a Salesforce Contact for every campaign member.
- Campaign Members can only be joined to any downstream touchpoints, opportunities, or dbt Cloud user signups if they have an `engaged_at` timestamp.
    - This timestamp indicates when a user took the minimum required action to be considered `engaged` with the campaign.
    - An example of this is a user registering for an event, or downloading a piece of content. A full list of engagements per campaign type can be found [in this Notion doc](https://www.notion.so/dbtlabs/Types-of-Marketing-Campaigns-a4e262dcda664c76b7e0c819b69af4c5).
- Since this dataset is not always 1 row per campaign member, **it is critical to use `count_distinct` when measuring the count of campaign members, contacts, touchpoints, opportunities, or dbt Cloud users**.
- While there is campaign information available as a part of this model, it would be advantageous to start any campaign analysis using the `marketing_campaign_mappings` model to filter relevant marketing campaigns, and then join in this model for analysis. This ensures all campaigns within the hierarchy are considered.

### Resources
- [Campaign 360 Dashboard](https://fishtown.looker.com/dashboards/318)

{% enddocs %}