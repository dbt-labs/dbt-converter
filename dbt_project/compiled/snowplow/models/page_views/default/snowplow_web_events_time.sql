


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

        min(
  
    ev.derived_tstamp::timestamp_ntz

) as min_tstamp,
        max(
  
    ev.derived_tstamp::timestamp_ntz

) as max_tstamp,

        sum(case when ev.event_name = 'page_view' then 1 else 0 end) as pv_count,
        sum(case when ev.event_name = 'page_ping' then 1 else 0 end) as pp_count,
        (sum(case when ev.event_name = 'page_ping' then 1 else 0 end) * 10) as time_engaged_in_s

    from events as ev
        inner join web_page_context as wp on ev.event_id = wp.root_id

    where ev.event_name in ('page_view', 'page_ping')
    group by 1

),




-- initial run, don't merge
merged as (

    select * from prep

)




select * from merged