
  create or replace   view analytics_dev.dbt_jstein.historical_snowplow_platform
  
   as (
    select *
from raw.snowplow_historical.platform


where _loaded_at > dateadd(d, -3, current_date)

  );

