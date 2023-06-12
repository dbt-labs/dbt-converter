
  
    

        create or replace transient table analytics_dev.dbt_jstein.snowplow_web_page_context  as
        (-- This one is a little tougher to make incremental
-- because there's no timestamp field here. We could
-- relocate the event collector_tstamp (by root_id)
-- onto snowplow_base_web_page_context, but that would
-- likely mitigate any performance gains!



with  __dbt__cte__snowplow_base_web_page_context as (
select * from analytics_dev.dbt_jstein.stg_snowplow_web_page_contexts
),web_page_context as (

    select * from __dbt__cte__snowplow_base_web_page_context

),

prep as (

    select
        root_id,
        id as page_view_id

    from web_page_context
    group by 1,2

),

duplicated as (

    select
        root_id

    from prep
    group by 1
    having count(*) > 1

)

select * from prep where root_id not in (select root_id from duplicated)
        );
      
  