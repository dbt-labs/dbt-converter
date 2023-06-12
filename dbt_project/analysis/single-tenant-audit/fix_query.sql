{#
create or replace table analytics.dbt_aescay.snowplow_web_events_scroll_depth as (

select *
from analytics.analytics.snowplow_web_events_scroll_depth
qualify row_number() over (
  partition by page_view_id 
  order by max_tstamp desc
) = 1 

);


-- test if this fix removes duplicate 
select
    page_view_id,
    count(*)
from analytics.dbt_aescay.snowplow_web_events_scroll_depth
where max_tstamp >= '2022-01-01'
group by 1
having count(*) > 1
order by 2 desc
limit 100;


-- backup old table

create or replace table analytics.analytics.snowplow_web_events_scroll_depth_backup as (

  select * from analytics.analytics.snowplow_web_events_scroll_depth
  
);

-- replace old table with corrected data

create or replace table analytics.analytics.snowplow_web_events_scroll_depth as (

    select * from analytics.dbt_aescay.snowplow_web_events_scroll_depth

);
#}

