select *
from raw.snowplow_historical.invocation_env


where _loaded_at > dateadd(d, - 3, current_date)
