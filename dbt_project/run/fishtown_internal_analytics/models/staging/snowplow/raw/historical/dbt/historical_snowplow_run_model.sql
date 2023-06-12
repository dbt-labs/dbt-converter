
  create or replace   view analytics_dev.dbt_jstein.historical_snowplow_run_model
  
   as (
    select *
from raw.snowplow_historical.run_model


where _loaded_at > dateadd(d, -3, current_date)

  );

