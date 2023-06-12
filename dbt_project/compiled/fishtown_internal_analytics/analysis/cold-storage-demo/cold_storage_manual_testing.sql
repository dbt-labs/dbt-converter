-- manual testing of performance for cold storage on large tables

-- this one sets a backup of the table in its current state so I can test loading in new data

-- create or replace table analytics.dbt_aescay.current_snowplow_event_backup as (
--     select * from analytics.dbt_aescay.current_snowplow_event
-- );

-- this one restores the backup in our current dev schema to re-test a flow

-- create or replace table analytics.dbt_aescay.current_snowplow_event as (
--     select * from analytics.dbt_aescay.current_snowplow_event_backup
-- );


-- last updated date for the test model (backup max date 2022-11-23)

select max(collector_tstamp) from analytics.dbt_aescay.current_snowplow_event
where collector_tstamp >= '2022-10-01';