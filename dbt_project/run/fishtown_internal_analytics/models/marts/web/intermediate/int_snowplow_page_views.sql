
  
    

        create or replace transient table analytics_dev.dbt_jstein.int_snowplow_page_views  as
        (


-- initializations





-- we are using 1-days window allowing us cover most of sessions
-- but model become much faster comparing to selecting all events
with all_events as (

    select * from analytics_dev.dbt_jstein.int_snowplow_web_events
    
    

),

-- we need to grab all events for any session that has appeared
-- in order to correctly process the session index below
relevant_sessions as (

    select distinct domain_sessionid
    from all_events
),

web_events as (

    select all_events.*
    from all_events
    join relevant_sessions using (domain_sessionid)

),

web_events_time as (

    select * from analytics_dev.dbt_jstein.snowplow_web_events_time

),

web_events_scroll_depth as (

    select * from analytics_dev.dbt_jstein.snowplow_web_events_scroll_depth

),

web_experiments as (

    select * from analytics_dev.dbt_jstein.int_web_experiments__joined

),



    web_timing_context as ( select * from analytics_dev.dbt_jstein.snowplow_web_timing_context ),





prep as (

    select
        -- user
        a.user_id as user_custom_id,
        a.domain_userid as user_snowplow_domain_id,
        a.network_userid as user_snowplow_crossdomain_id,

        b.min_tstamp,
        b.max_tstamp,

        -- sesssion
        a.domain_sessionid as session_id,
        a.domain_sessionidx as session_cookie_index,

        -- page view
        a.page_view_id,

        row_number() over (partition by a.domain_sessionid order by a.derived_tstamp) as page_view_in_session_index,
        count(*) over (partition by domain_sessionid) as max_session_page_view_index,

        -- page view: time
        
    convert_timezone('UTC', 'UTC', b.min_tstamp)
 as page_view_start,
        
    convert_timezone('UTC', 'UTC', b.max_tstamp)
 as page_view_end,

        -- page view: time in the user's local timezone
    convert_timezone('UTC', coalesce(a.os_timezone, 'UTC'), b.min_tstamp)
 as page_view_start_local,
        
    convert_timezone('UTC', coalesce(a.os_timezone, 'UTC'), b.max_tstamp)
 as page_view_end_local,

        -- engagement
        b.time_engaged_in_s,

        case
            when b.time_engaged_in_s between 0 and 9 then '0s to 9s'
            when b.time_engaged_in_s between 10 and 29 then '10s to 29s'
            when b.time_engaged_in_s between 30 and 59 then '30s to 59s'
            when b.time_engaged_in_s > 59 then '60s or more'
            else null
        end as time_engaged_in_s_tier,

        c.hmax as horizontal_pixels_scrolled,
        c.vmax as vertical_pixels_scrolled,

        c.relative_hmax as horizontal_percentage_scrolled,
        c.relative_vmax as vertical_percentage_scrolled,

        case
            when c.relative_vmax between 0 and 24 then '0% to 24%'
            when c.relative_vmax between 25 and 49 then '25% to 49%'
            when c.relative_vmax between 50 and 74 then '50% to 74%'
            when c.relative_vmax between 75 and 100 then '75% to 100%'
            else null
        end as vertical_percentage_scrolled_tier,

        case when b.time_engaged_in_s >= 30 and c.relative_vmax >= 25 then true else false end as user_engaged,

        -- page
        a.page_urlhost || a.page_urlpath as page_url,

        a.page_urlscheme as page_url_scheme,
        a.page_urlhost as page_url_host,
        a.page_urlport as page_url_port,
        a.page_urlpath as page_url_path,
        a.page_urlquery as page_url_query,
        a.page_urlfragment as page_url_fragment,

        a.page_title,

        c.doc_width as page_width,
        c.doc_height as page_height,

        -- referer
        a.refr_urlhost || a.refr_urlpath as referer_url,

        a.refr_urlscheme as referer_url_scheme,
        a.refr_urlhost as referer_url_host,
        a.refr_urlport as referer_url_port,
        a.refr_urlpath as referer_url_path,
        a.refr_urlquery as referer_url_query,
        a.refr_urlfragment as referer_url_fragment,

        case
            when a.refr_medium is null then 'direct'
            when a.refr_medium = 'unknown' then 'other'
            else a.refr_medium
        end as referer_medium,

        a.refr_source as referer_source,
        a.refr_term as referer_term,

        -- marketing
        a.mkt_medium as marketing_medium,
        a.mkt_source as marketing_source,
        a.mkt_term as marketing_term,
        a.mkt_content as marketing_content,
        a.mkt_campaign as marketing_campaign,
        -- these come straight from the event
        a.mkt_clickid as marketing_click_id,
        a.mkt_network as marketing_network,

        -- location
        a.geo_country,
        a.geo_region,
        a.geo_region_name,
        a.geo_city,
        a.geo_zipcode,
        a.geo_latitude,
        a.geo_longitude,
        a.geo_timezone, -- often null (use os_timezone instead)

        -- ip
        a.user_ipaddress as ip_address,
        a.ip_isp,
        a.ip_organization,
        a.ip_domain,
        a.ip_netspeed as ip_net_speed,

        -- application
        a.app_id,

        
            cast(null as TEXT) as browser,
            a.br_family as browser_name,
            a.br_name as browser_major_version,
            a.br_version as browser_minor_version,
            cast(null as TEXT) as browser_build_version,
            a.os_family as os,
            a.os_name as os_name,
            cast(null as TEXT) as os_major_version,
            cast(null as TEXT) as os_minor_version,
            cast(null as TEXT) as os_build_version,
            cast(null as TEXT) as device,
        

        c.br_viewwidth as browser_window_width,
        c.br_viewheight as browser_window_height,

        a.br_lang as browser_language,

        -- os
        a.os_manufacturer,
        a.os_timezone,

        
            e.redirect_time_in_ms,
            e.unload_time_in_ms,
            e.app_cache_time_in_ms,
            e.dns_time_in_ms,
            e.tcp_time_in_ms,
            e.request_time_in_ms,
            e.response_time_in_ms,
            e.processing_time_in_ms,
            e.dom_loading_to_interactive_time_in_ms,
            e.dom_interactive_to_complete_time_in_ms,
            e.onload_time_in_ms,
            e.total_time_in_ms,
        

        -- device
        a.br_renderengine as browser_engine,
        a.dvce_type as device_type,
        a.dvce_ismobile as device_is_mobile,

        -- web experiments
        web_experiments.experiment_name,
        web_experiments.branch_name
        , a.database_source
        

    from web_events as a
        inner join web_events_time as b
            on a.page_view_id = b.page_view_id
        inner join web_events_scroll_depth as c
            on a.page_view_id = c.page_view_id
        left join web_experiments
            on a.page_view_id = web_experiments.page_view_id

        

        

            left outer join web_timing_context as e on a.page_view_id = e.page_view_id

        

    where (a.br_family != 'Robot/Spider' or a.br_family is null)
      and (
        not (
              lower(useragent) like '%bot%'or
              lower(useragent) like '%crawl%'or
              lower(useragent) like '%slurp%'or
              lower(useragent) like '%spider%'or
              lower(useragent) like '%archiv%'or
              lower(useragent) like '%spinn%'or
              lower(useragent) like '%sniff%'or
              lower(useragent) like '%seo%'or
              lower(useragent) like '%audit%'or
              lower(useragent) like '%survey%'or
              lower(useragent) like '%pingdom%'or
              lower(useragent) like '%worm%'or
              lower(useragent) like '%capture%'or
              lower(useragent) like '%browsershots%'or
              lower(useragent) like '%screenshots%'or
              lower(useragent) like '%analyz%'or
              lower(useragent) like '%index%'or
              lower(useragent) like '%thumb%'or
              lower(useragent) like '%check%'or
              lower(useragent) like '%facebook%'or
              lower(useragent) like '%phantomjs%'or
              lower(useragent) like '%a_archiver%'or
              lower(useragent) like '%facebookexternalhit%'or
              lower(useragent) like '%bingpreview%'or
              lower(useragent) like '%360user-agent%'or
              lower(useragent) like '%semalt%')
        or a.useragent is null
      )
      and coalesce(a.br_type, 'unknown') not in ('Bot/Crawler', 'Robot')
      and a.domain_userid is not null
      and a.domain_sessionidx > 0

),

url_parameter_cleanup as (

    select
        * exclude (marketing_medium, marketing_source, marketing_campaign, marketing_content, marketing_term),

        lower(
            coalesce(
                nullif(

    split_part(
        

    split_part(
        page_url_query,
        'utm_medium=',
        2
        )

,
        '&',
        1
        )

,''),
                nullif(referer_medium,'')
            )
        ) as marketing_medium,

        lower(
            coalesce(
                nullif(

    split_part(
        

    split_part(
        page_url_query,
        'utm_source=',
        2
        )

,
        '&',
        1
        )

,''),
                nullif(referer_source,''),
                nullif(referer_url_host,'')
            )   
        ) as marketing_source,

        lower(
            coalesce(
                nullif(

    split_part(
        

    split_part(
        page_url_query,
        'utm_campaign=',
        2
        )

,
        '&',
        1
        )

,''),
                nullif(

    split_part(
        

    split_part(
        referer_url_query,
        'utm_campaign=',
        2
        )

,
        '&',
        1
        )

,'')
            )
        ) as marketing_campaign,

        lower(
            coalesce(
                nullif(

    split_part(
        

    split_part(
        page_url_query,
        'utm_content=',
        2
        )

,
        '&',
        1
        )

,''),
                nullif(

    split_part(
        

    split_part(
        referer_url_query,
        'utm_content=',
        2
        )

,
        '&',
        1
        )

,'')
             )
         ) as marketing_content,

        lower(
            coalesce(
                nullif(

    split_part(
        

    split_part(
        page_url_query,
        'utm_term=',
        2
        )

,
        '&',
        1
        )

,''),
                nullif(

    split_part(
        

    split_part(
        referer_url_query,
        'utm_term=',
        2
        )

,
        '&',
        1
        )

,'')
             )
         ) as marketing_term,

        case
            when max_session_page_view_index = page_view_in_session_index
                then 1
            else 0
        end as last_page_view_in_session
        
    from prep

),

final as (

    select
        * exclude (marketing_medium),

        case
            when page_view_in_session_index = 1 and marketing_medium = 'internal' then 'direct'
            else marketing_medium
        end as marketing_medium
    
    from url_parameter_cleanup

)

select * from final
        );
      
  