

with sessions as (

    select
        "SESSION_ID",
  "INFERRED_USER_ID",
  "CLOUD_USER_ID",
  "SALESFORCE_CONTACT_ID",
  "USER_SNOWPLOW_DOMAIN_ID",
  "USER_SNOWPLOW_CROSSDOMAIN_ID",
  "APP_ID",
  "BROWSER",
  "BROWSER_BUILD_VERSION",
  "BROWSER_ENGINE",
  "BROWSER_LANGUAGE",
  "BROWSER_MAJOR_VERSION",
  "BROWSER_MINOR_VERSION",
  "BROWSER_NAME",
  "DEVICE",
  "DEVICE_IS_MOBILE",
  "DEVICE_TYPE",
  "FIRST_PAGE_TITLE",
  "FIRST_PAGE_URL",
  "FIRST_PAGE_URL_FRAGMENT",
  "FIRST_PAGE_URL_HOST",
  "FIRST_PAGE_URL_PATH",
  "FIRST_PAGE_URL_PORT",
  "FIRST_PAGE_URL_QUERY",
  "FIRST_PAGE_URL_SCHEME",
  "EXIT_PAGE_URL",
  "GEO_CITY",
  "GEO_COUNTRY",
  "GEO_LATITUDE",
  "GEO_LONGITUDE",
  "GEO_REGION",
  "GEO_REGION_NAME",
  "GEO_TIMEZONE",
  "GEO_ZIPCODE",
  "IP_ADDRESS",
  "IP_DOMAIN",
  "IP_ISP",
  "IP_NET_SPEED",
  "IP_ORGANIZATION",
  "MARKETING_CAMPAIGN",
  "MARKETING_CLICK_ID",
  "MARKETING_CONTENT",
  "MARKETING_MEDIUM",
  "MARKETING_NETWORK",
  "MARKETING_SOURCE",
  "MARKETING_TERM",
  "OS",
  "OS_BUILD_VERSION",
  "OS_MAJOR_VERSION",
  "OS_MANUFACTURER",
  "OS_MINOR_VERSION",
  "OS_NAME",
  "OS_TIMEZONE",
  "PAGE_VIEWS",
  "REFERER_MEDIUM",
  "REFERER_SOURCE",
  "REFERER_TERM",
  "REFERER_URL",
  "REFERER_URL_FRAGMENT",
  "REFERER_URL_HOST",
  "REFERER_URL_PATH",
  "REFERER_URL_PORT",
  "REFERER_URL_QUERY",
  "REFERER_URL_SCHEME",
  "SESSION_START",
  "SESSION_START_LOCAL",
  "SESSION_END",
  "SESSION_END_LOCAL",
  "SESSION_COOKIE_INDEX",
  "TIME_ENGAGED_IN_S",
  "TIME_ENGAGED_IN_S_TIER",
  "USER_BOUNCED",
  "FIRST_DATABASE_SOURCE",
  "LAST_DATABASE_SOURCE",
  "SESSION_INDEX"
    
    from analytics_dev.dbt_jstein.int_snowplow_sessions
    
    

),

signup_attempts as (

    select * from analytics_dev.dbt_jstein.current_snowplow_submit_form
    where form_id = 'signup'

    

),

region_lookup as (

    select * from analytics_dev.dbt_jstein.country_to_region_mappings

),

web_experiments as (

    select * from analytics_dev.dbt_jstein.int_web_experiment_sessions

),

utm_mappings as (

    select * from analytics_dev.dbt_jstein.fct_notion_channel_mapping
    where source is not null
        and medium is not null

),

unique_regions as (

  select distinct
      country_code,
      region_category

  from region_lookup

),

signup_session_ids as (

    select distinct
        domain_sessionid as session_id

    from signup_attempts

),

sessions_enriched as (

    select
        sessions.*,

        case
            when signup_session_ids.session_id is not null
                then true
            else false
        end as user_attempted_signup,

        unique_regions.region_category,

        --experiments
        web_experiments.experiment_name,
        web_experiments.branch_name

    from sessions
    left join signup_session_ids
        on sessions.session_id = signup_session_ids.session_id
    left join unique_regions
        on sessions.geo_country = unique_regions.country_code
    left join web_experiments
        on sessions.session_id = web_experiments.session_id

),

parse_marketing_dimensions as (

    select
        *,
        -- the below macro parses all campaigns/content that include 2 delimiters (which is standard per our nomenclature)
        
    
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



    from sessions_enriched

),

with_utm_mapping_id as (

    select 
        *,
        
    
md5(cast(coalesce(cast(marketing_source as TEXT), '') || '-' || coalesce(cast(marketing_medium as TEXT), '') as TEXT)) as source_mapping_id,
        
    
md5(cast(coalesce(cast(marketing_campaign as TEXT), '') as TEXT)) as campaign_id
    from parse_marketing_dimensions

),

join_utm_mappings as (

    select 
        with_utm_mapping_id.*,
        utm_mappings.channel,
        utm_mappings.sub_channel,
        replace(replace(marketing_campaign,'%20',' '),'+',' ') marketing_campaign_with_spaces,
        date(session_start) session_start_date
    from with_utm_mapping_id
    left join utm_mappings
    using (source_mapping_id)

),

campaign_replacements as (

    select
        * exclude (marketing_campaign_with_spaces),

        -- the below replacements are required since our agency placed different names in the UTM parameters
        -- versus what they had in the actual ad names
        -- TO DO: devleop a more robust campaign name replacement mechanism - this is a short term solution
        case
            when marketing_campaign_with_spaces = 'dbt - brand - us - dc' then 'dbt - brand - dc'
            when marketing_campaign_with_spaces = 'dbt - nonbranded - us - dc' then 'dbt - non-branded - us - dc'
            else marketing_campaign_with_spaces
        end as marketing_campaign_with_spaces

    from join_utm_mappings

),

with_ad_mapping_id as (

    select 
        *,       
        
    
md5(cast(coalesce(cast(marketing_campaign_with_spaces as TEXT), '') || '-' || coalesce(cast(sub_channel as TEXT), '') || '-' || coalesce(cast(session_start_date as TEXT), '') as TEXT)) as ad_web_mapping_id
    from campaign_replacements
)

select * from with_ad_mapping_id