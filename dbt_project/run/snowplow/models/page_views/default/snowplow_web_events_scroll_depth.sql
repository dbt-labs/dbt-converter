
  
    

        create or replace transient table analytics_dev.dbt_jstein.snowplow_web_events_scroll_depth  as
        (

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

        wp.page_view_id,

        max(ev.collector_tstamp) as max_tstamp,

        max(ev.doc_width) as doc_width,
        max(ev.doc_height) as doc_height,

        max(ev.br_viewwidth) as br_viewwidth,
        max(ev.br_viewheight) as br_viewheight,

        least(greatest(min(coalesce(ev.pp_xoffset_min, 0)), 0), max(ev.doc_width)) as hmin,
        least(greatest(max(coalesce(ev.pp_xoffset_max, 0)), 0), max(ev.doc_width)) as hmax,

        least(greatest(min(coalesce(ev.pp_yoffset_min, 0)), 0), max(ev.doc_height)) as vmin,
        least(greatest(max(coalesce(ev.pp_yoffset_max, 0)), 0), max(ev.doc_height)) as vmax

    from events as ev
        inner join web_page_context as wp on ev.event_id = wp.root_id

    where ev.event_name in ('page_view', 'page_ping')
      and ev.doc_height > 0
      and ev.doc_width > 0

    group by 1

),

relative as (

    select

        page_view_id,
        max_tstamp,

        doc_width,
        doc_height,
        br_viewwidth,
        br_viewheight,

        hmin,
        hmax,
        vmin,
        vmax,

        round(100*(greatest(hmin, 0)/cast(doc_width as float))) as relative_hmin,
        round(100*(least(hmax + br_viewwidth, doc_width)/cast(doc_width as float))) as relative_hmax,
        round(100*(greatest(vmin, 0)/cast(doc_height as float))) as relative_vmin,
        round(100*(least(vmax + br_viewheight, doc_height)/cast(doc_height as float))) as relative_vmax

    from prep

),



merged as (

    select * from relative

)



select * from merged
        );
      
  