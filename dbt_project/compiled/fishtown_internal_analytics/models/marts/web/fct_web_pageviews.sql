


with page_views as (

    select * from analytics_dev.dbt_jstein.int_snowplow_page_views

    

),

sessions as (

    select * from analytics_dev.dbt_jstein.int_snowplow_sessions

    

),

refreshes as (

    select * from analytics_dev.dbt_jstein.int_cloud_ide_refreshes

),

utm_mappings as (

    select * from analytics_dev.dbt_jstein.fct_notion_channel_mapping
    where source is not null
        and medium is not null

),

id_map as (

    select distinct
        session_id,
        inferred_user_id,
        cloud_user_id,
        salesforce_contact_id
    
    from sessions

),

page_views_mapped as (
    --we have a mapping CTE so we can populate multi-tenant
    --database_sources and then do the hashing/enriching joins
    select

        case
            -- this only assigns the cloud database source designation to events
            -- that we are certain are actually coming from multi-tenant cloud
            when page_views.app_id not in ('dbt-docs', 'dbt cloud', 'cloud-ui')
              or page_views.page_url_host = 'cloud.getdbt.com'
                then 'cloud'
            else page_views.database_source
        end as database_source,

        id_map.inferred_user_id,
        id_map.cloud_user_id,
        id_map.salesforce_contact_id,

        "USER_CUSTOM_ID",
  "USER_SNOWPLOW_DOMAIN_ID",
  "USER_SNOWPLOW_CROSSDOMAIN_ID",
  "MIN_TSTAMP",
  "MAX_TSTAMP",
  "SESSION_ID",
  "SESSION_COOKIE_INDEX",
  "PAGE_VIEW_ID",
  "PAGE_VIEW_IN_SESSION_INDEX",
  "MAX_SESSION_PAGE_VIEW_INDEX",
  "PAGE_VIEW_START",
  "PAGE_VIEW_END",
  "PAGE_VIEW_START_LOCAL",
  "PAGE_VIEW_END_LOCAL",
  "TIME_ENGAGED_IN_S",
  "TIME_ENGAGED_IN_S_TIER",
  "HORIZONTAL_PIXELS_SCROLLED",
  "VERTICAL_PIXELS_SCROLLED",
  "HORIZONTAL_PERCENTAGE_SCROLLED",
  "VERTICAL_PERCENTAGE_SCROLLED",
  "VERTICAL_PERCENTAGE_SCROLLED_TIER",
  "USER_ENGAGED",
  "PAGE_URL",
  "PAGE_URL_SCHEME",
  "PAGE_URL_HOST",
  "PAGE_URL_PORT",
  "PAGE_URL_PATH",
  "PAGE_URL_QUERY",
  "PAGE_URL_FRAGMENT",
  "PAGE_TITLE",
  "PAGE_WIDTH",
  "PAGE_HEIGHT",
  "REFERER_URL",
  "REFERER_URL_SCHEME",
  "REFERER_URL_HOST",
  "REFERER_URL_PORT",
  "REFERER_URL_PATH",
  "REFERER_URL_QUERY",
  "REFERER_URL_FRAGMENT",
  "REFERER_MEDIUM",
  "REFERER_SOURCE",
  "REFERER_TERM",
  "MARKETING_CLICK_ID",
  "MARKETING_NETWORK",
  "GEO_COUNTRY",
  "GEO_REGION",
  "GEO_REGION_NAME",
  "GEO_CITY",
  "GEO_ZIPCODE",
  "GEO_LATITUDE",
  "GEO_LONGITUDE",
  "GEO_TIMEZONE",
  "IP_ADDRESS",
  "IP_ISP",
  "IP_ORGANIZATION",
  "IP_DOMAIN",
  "IP_NET_SPEED",
  "APP_ID",
  "BROWSER",
  "BROWSER_NAME",
  "BROWSER_MAJOR_VERSION",
  "BROWSER_MINOR_VERSION",
  "BROWSER_BUILD_VERSION",
  "OS",
  "OS_NAME",
  "OS_MAJOR_VERSION",
  "OS_MINOR_VERSION",
  "OS_BUILD_VERSION",
  "DEVICE",
  "BROWSER_WINDOW_WIDTH",
  "BROWSER_WINDOW_HEIGHT",
  "BROWSER_LANGUAGE",
  "OS_MANUFACTURER",
  "OS_TIMEZONE",
  "REDIRECT_TIME_IN_MS",
  "UNLOAD_TIME_IN_MS",
  "APP_CACHE_TIME_IN_MS",
  "DNS_TIME_IN_MS",
  "TCP_TIME_IN_MS",
  "REQUEST_TIME_IN_MS",
  "RESPONSE_TIME_IN_MS",
  "PROCESSING_TIME_IN_MS",
  "DOM_LOADING_TO_INTERACTIVE_TIME_IN_MS",
  "DOM_INTERACTIVE_TO_COMPLETE_TIME_IN_MS",
  "ONLOAD_TIME_IN_MS",
  "TOTAL_TIME_IN_MS",
  "BROWSER_ENGINE",
  "DEVICE_TYPE",
  "DEVICE_IS_MOBILE",
  "EXPERIMENT_NAME",
  "BRANCH_NAME",
  "MARKETING_SOURCE",
  "MARKETING_CAMPAIGN",
  "MARKETING_CONTENT",
  "MARKETING_TERM",
  "LAST_PAGE_VIEW_IN_SESSION",
  "MARKETING_MEDIUM"

    from page_views
    left join id_map using (session_id)

    -- we want to filter out events that we are uncertain about. This puts us
    -- in a position where unmapped single-tenants are not processed instead of
    -- inappropriately processing them as multi-tenant which was the old way.
    where database_source is not null

),

windowed as (

    select
        *,
        row_number() over (
            partition by inferred_user_id, session_id
            order by page_view_start
        ) as session_index,

        row_number() over (
            partition by inferred_user_id
            order by page_view_start
        ) as page_view_index

    from page_views_mapped

),

cloud_fields as (

    select
        page_view_id,
        /*
            Some scary-looking but harmless regexes follow. Big idea here
            is that we want to categorize different types of in-app page
            views for downstream analysis. All of the following have 'or'
            statements here. This is because we swapped url pattern when
            we launched the new UI.
        */

        regexp_like(page_url_fragment,
            '/accounts/[0-9]+/settings/?.*', 'i'
        ) or
        regexp_like(page_url_path,
            '.*/?settings/account/?.*', 'i'
        ) as _is_account_settings,

        regexp_like(page_url_fragment,
            '/accounts/[0-9]+/projects/[0-9]+/(environments|jobs|runs)/?.*', 'i'
        ) or
        regexp_like(page_url_path,
            '.*/?deploy/?.*', 'i'
        ) as _is_scheduled_run,

        regexp_like(page_url_fragment,
            '/accounts/[0-9]+/projects(/[0-9]+)?/setup/?.*', 'i'
        ) or
        regexp_like(page_url_path,
            '.*/?[0-9]+/projects(/[0-9]+)?/setup/?.*', 'i'
        ) as _is_onboarding,

        regexp_like(page_url_fragment,
            '/accounts/[0-9]+/projects/[0-9]+/develop/?.*', 'i'
        ) or
        regexp_like(page_url_path,
            '.*/?accounts/[0-9]+/projects/[0-9]+/develop/?.*', 'i'
        ) or
        regexp_like(page_url_path,
            '.*/?develop/?.*', 'i'
        ) as _is_ide,

        regexp_like(page_url_fragment,
            '/profile/?.*', 'i'
        ) or
        regexp_like(page_url_path,
            '.*/?settings/profile/?.*', 'i'
        ) as _is_profile,

        regexp_like(page_url_fragment,
            '/accounts/[0-9]+/projects/[0-9]+/(dashboard|home)/?.*', 'i'
        ) or
        -- this is because we had a '/next/' path when we were beta testing the new UI
        regexp_like(page_url_path,
            '.*/?next/?.*', 'i'
        ) or
        page_url_path = '' as _is_home,

        coalesce(
            regexp_substr(page_url_fragment,
                '/accounts/([0-9]+)/?.*', 1, 1, 'ie', 1
            ),
            regexp_substr(page_url,
                '.*/?accounts/([0-9]+)/?.*', 1, 1, 'ie', 1
            ),
            -- slightly complex logic to account for some paths not having any account_id
            -- this has to be treated in an exclusionary way (i.e. using 'not in') because
            -- there's no good way to know what will preceed the account_id since dropping
            -- the explicit call out in the path
            case 
                when
                    regexp_substr(page_url_path,
                        '([a-z]+)/([0-9]+)', 1, 1, 'ie', 1
                    ) not in ('projects', 'environments', 'jobs', 'runs')
                then
                    regexp_substr(page_url_path,
                        '([a-z]+)/([0-9]+)', 1, 1, 'ie', 2
                    )
                else null
            end
        )::varchar as cloud_account_id,

        coalesce(
            regexp_substr(page_url_fragment,
                '/accounts/([0-9]+)/projects/([0-9]+)/?.*', 1, 1, 'ie', 2
            ),
            regexp_substr(page_url,
                '.*?/([0-9]+)/projects/([0-9]+)/?.*', 1, 1, 'ie', 2
            ),
            -- accounting for profile settings of a specific project
            regexp_substr(page_url,
                '.*?/projects/([0-9]+)/?.*', 1, 1, 'ie', 1
            )
        )::varchar as cloud_project_id,

        case
            when page_url_path ilike '/login%' then 'login'
            when page_url_path ilike '/enterprise-login%' then 'login'
            when page_url_path ilike '/signup%' then 'signup'
            when page_url_path ilike '/accept-invite%' then 'accept invite'
            when page_url_path ilike '/verify-email%' then 'verify email'
            when page_url_path ilike '/no-account%' then 'no account error'
            when page_url_path ilike '/reset-password%' then 'reset password'

            when _is_account_settings then 'account settings'
            when _is_scheduled_run then 'scheduled run'
            when _is_ide then 'ide'
            when _is_profile then 'profile'
            when _is_onboarding then 'onboarding'
            when _is_home then 'home'
            when page_url_path = '/' and page_url_fragment = '' then 'home'

            else 'uncategorized'
        end as cloud_page_type

    from windowed
    where page_url_host = 'cloud.getdbt.com'
      or (
        page_url_host = 'www.getdbt.com' and
        page_url_path ilike '/signup%'
      )
      or (
        database_source != 'cloud'
      )

),

page_views_enriched as (

    select
        -- identifications
        case
          when database_source = 'cloud'
                then cloud_account_id::varchar
          else md5(database_source || cloud_account_id)
      end as cloud_account_id,

      cloud_account_id as tenant_cloud_account_id,
        case
          when database_source = 'cloud'
                then cloud_project_id::varchar
          else md5(database_source || cloud_project_id)
      end as cloud_project_id,

      cloud_project_id as tenant_cloud_project_id,

        cloud_fields.cloud_page_type,

        coalesce(refreshes.is_refresh, false) as is_refresh,

        windowed.*

    from windowed
    left join cloud_fields using (page_view_id)
    left join refreshes using (page_view_id)

),

parse_marketing_dimensions as (

    select
        *,
        
    
md5(cast(coalesce(cast(marketing_medium as TEXT), '') || '-' || coalesce(cast(marketing_source as TEXT), '') as TEXT)) as source_mapping_id,
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



    from page_views_enriched

),

join_utm_mappings as (

    select 
        parse_marketing_dimensions.*,
        utm_mappings.channel,
        utm_mappings.sub_channel
    from parse_marketing_dimensions
    left join utm_mappings
    using (source_mapping_id)

)

select * from join_utm_mappings