
  create or replace   view analytics_dev.dbt_jstein.stg_dbt_events
  
   as (
    

select * from analytics_dev.dbt_jstein.stg_snowplow_events
where app_id = 'dbt'
    and is_dev_event = false
  );

