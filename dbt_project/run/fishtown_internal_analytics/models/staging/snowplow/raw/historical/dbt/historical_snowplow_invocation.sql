
  create or replace   view analytics_dev.dbt_jstein.historical_snowplow_invocation
  
   as (
    select *,
    null::string as adapter_type,
    null::string as adapter_unique_id

from raw.snowplow_historical.invocation


where _loaded_at > dateadd(d, -3, current_date)

  );

