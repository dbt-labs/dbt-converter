with

ad_reporting as (

    select 
        {{ dbt_utils.star(
            from=ref('ad_reporting__url_report'),
                except=["campaign_name","platform"])
        }},
        lower(campaign_name) campaign_name,

        -- the below converts `google_ads` to `Google Ads`
        -- this ensures the values align with our channel mapping model
        -- for any new ad source, the platform will need to be renamed below
         case
            when platform = 'google_ads' then 'Google Ads'
            when platform = 'linkedin_ads' then 'LinkedIn Ads'
            when platform = 'reddit_ads' then 'Reddit Ads'
            else platform
        end as platform

    from {{ ref('ad_reporting__url_report') }}

),

with_id as (

    select
        -- this is ugly, but since the Fivetran package doesn't include ad-level data, this is required to get a unique value per row
        {{ dbt_utils.generate_surrogate_key([
            'account_id',
            'campaign_id',
            'ad_group_id',
            'base_url',
            'utm_source',
            'utm_medium',
            'utm_campaign',
            'utm_term',
            'utm_content',
            'date_day'
        ]) }} as id,
        {{ dbt_utils.generate_surrogate_key([
            'campaign_name',
            'platform',
            'date_day'
        ]) }} as ad_web_mapping_id,
        date_day,
        account_name,
        account_id,
        base_url,
        url_host,
        url_path,
        utm_source,
        utm_medium,
        utm_campaign,
        utm_content,
        utm_term,
        campaign_id,
        campaign_name,
        ad_group_id,
        ad_group_name,
        platform,

        sum(coalesce(clicks, 0)) as clicks,
        sum(coalesce(impressions, 0)) as impressions,
        sum(coalesce(spend, 0)) as spend

    from ad_reporting
    {{ dbt_utils.group_by(18) }}

)

select * from with_id
