
  
    

        create or replace transient table analytics_dev.dbt_jstein.int_snowplow_web_events  as
        (-- transform all *new* events, then delete existing
-- and insert new (by page_view_id). No sql_where because
-- we only want to process _new_ events




with  __dbt__cte__snowplow_base_events as (
with source as (

    select * from analytics_dev.dbt_jstein.stg_snowplow_web_events

),

filtered as (

    select *
    from source


    where true

    

    --these fields should never be null -- there's a quirk where small numbers of
    --events have made it through without these fields -- ignore these events
    --so as not to throw off downstream models.
        and domain_sessionid is not null
        and domain_sessionidx is not null
        and domain_userid is not null

)

select * from filtered
),all_events as (

    select * from __dbt__cte__snowplow_base_events

),

events as (

    select * from all_events
    
    

),

web_page_context as (

    select * from analytics_dev.dbt_jstein.snowplow_web_page_context

),

prep as (

    select

        ev.event_id,

        ev.user_id,
        ev.domain_userid,
        ev.network_userid,

        ev.collector_tstamp,

        ev.domain_sessionid,
        ev.domain_sessionidx,

        wp.page_view_id,

        ev.page_title,

        ev.page_urlscheme,
        ev.page_urlhost,
        ev.page_urlport,
        ev.page_urlpath,
        ev.page_urlquery,
        ev.page_urlfragment,

        ev.refr_urlscheme,
        ev.refr_urlhost,
        ev.refr_urlport,
        ev.refr_urlpath,
        ev.refr_urlquery,
        ev.refr_urlfragment,

        ev.refr_medium,
        ev.refr_source,
        ev.refr_term,

        ev.mkt_medium,
        ev.mkt_source,
        ev.mkt_term,
        ev.mkt_content,
        ev.mkt_campaign,
        ev.mkt_clickid,
        ev.mkt_network,

        ev.geo_country,
        ev.geo_region,
        ev.geo_region_name,
        ev.geo_city,
        ev.geo_zipcode,
        ev.geo_latitude,
        ev.geo_longitude,
        ev.geo_timezone,

        ev.user_ipaddress,

        ev.ip_isp,
        ev.ip_organization,
        ev.ip_domain,
        ev.ip_netspeed,

        ev.app_id,

        ev.useragent,
        ev.br_name,
        ev.br_family,
        ev.br_version,
        ev.br_type,
        ev.br_renderengine,
        ev.br_lang,
        ev.dvce_type,
        ev.dvce_ismobile,

        ev.os_name,
        ev.os_family,
        ev.os_manufacturer,
        replace(ev.os_timezone, '%2F', '/') as os_timezone,

        ev.name_tracker, -- included to filter on
        ev.dvce_created_tstamp, -- included to sort on,
        ev.derived_tstamp
        , ev.database_source
        

    from events as ev
        inner join web_page_context as wp  on ev.event_id = wp.root_id

    where ev.platform = 'web'
      and ev.event_name = 'page_view'

),

dedupe as (

    select *,
        row_number () over (partition by page_view_id order by derived_tstamp) as n

    from prep

)

select * from dedupe where n = 1
        );
      
  