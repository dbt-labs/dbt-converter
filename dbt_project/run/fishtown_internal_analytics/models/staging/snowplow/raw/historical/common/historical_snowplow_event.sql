
  create or replace   view analytics_dev.dbt_jstein.historical_snowplow_event
  
   as (
    select *
from raw.snowplow_historical.event


where _loaded_at > dateadd(d, -3, current_date)

  );

