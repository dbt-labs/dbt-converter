
  create or replace   view analytics_dev.dbt_jstein.historical_snowplow_invocation_env
  
   as (
    select *
from raw.snowplow_historical.invocation_env


where _loaded_at > dateadd(d, -3, current_date)

  );

