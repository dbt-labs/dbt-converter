
  create or replace   view analytics_dev.dbt_jstein.historical_snowplow_web_page_context
  
   as (
    select *
from raw.snowplow_historical.web_page


where _loaded_at > dateadd(d, -3, current_date)

  );

