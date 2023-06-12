with

web as (

    select * from {{ ref('fct_web_sessions') }}

),

salesforce as (

    select * from {{ ref('stg_salesforce__campaigns') }}
    where is_deleted = false
        and is_attributable = true

),

hubspot_emails as (

    select * from {{ ref('stg_hubspot__marketing_campaigns') }}

),

ad_reporting as (

    select * from {{ ref('fct_ad_reporting_daily') }}

),

social_media as (

    select * from {{ ref('dim_organic_social_posts') }}

),

-- the below logic is required because Campaigns can be renamed, while retaining the same campaign_id
-- this ensures we have 1 row per campaign from ad_reporting sources, and it defaults to the latest value
ad_reporting_windowed as (

    select distinct
        campaign_id,
        platform,

        last_value(campaign_name) over (
            partition by campaign_id
            order by date_day
        ) as campaign_name,

        sum(spend) over (
            partition by campaign_id
        ) as total_spend

    from ad_reporting

),

unioned as (

    select
        campaign_id::varchar as parent_campaign_id,
        campaign_id::varchar as campaign_id,
        marketing_campaign as parent_campaign_name,
        marketing_campaign as campaign_name,
        'Snowplow' as data_source,
        null as spend
    
    from web
    where marketing_campaign_name is not null
    group by 1,2,3,4,5

    union all 

    select
        parent_campaign_id::varchar as parent_campaign_id,
        campaign_id::varchar as campaign_id,
        parent_campaign_name,
        campaign_name,
        'Salesforce' as data_source,
        sum(actual_cost) as spend
    
    from salesforce
    group by 1,2,3,4,5

    union all 

    select
        parent_campaign_id::varchar as parent_campaign_id,
        marketing_email_id::varchar as campaign_id,
        parent_campaign_name,
        email_name as campaign_name,
        'Hubspot Emails' as data_source,
        null as spend

    from hubspot_emails
    group by 1,2,3,4,5

    union all

    select
        campaign_id::varchar as parent_campaign_id,
        campaign_id::varchar as campaign_id,
        campaign_name as parent_campaign_name,
        campaign_name,
        platform as data_source,
        total_spend as spend
    
    from ad_reporting_windowed
    
    union all

    select
        parent_campaign_id::varchar as parent_campaign_id,
        post_id::varchar as campaign_id,
        parent_campaign_name,
        post_message as campaign_name,
        initcap(platform) || ' Organic' as data_source,
        null as spend

    from social_media
    where parent_campaign_id is not null
    group by 1,2,3,4,5

),

with_id as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'campaign_id',
            'data_source'
        ])}} as campaign_source_id,
    
    parent_campaign_id,
    campaign_id,
    parent_campaign_name,
    campaign_name,
    data_source,

    case 
        when len(parent_campaign_name) - len(replace(parent_campaign_name, '_', '')) > 1 then lower(split_part(parent_campaign_name, '_', 1))
    end as marketing_campaign_period,

    case 
        when len(parent_campaign_name) - len(replace(parent_campaign_name, '_', '')) > 1 then lower(split_part(parent_campaign_name, '_', 2))
    end as marketing_campaign_name,

    case 
        when len(parent_campaign_name) - len(replace(parent_campaign_name, '_', '')) > 1 then lower(split_part(parent_campaign_name, '_', 3))
    end as marketing_campaign_goal,

    coalesce(spend,0) as spend

    from unioned

)

select * from with_id