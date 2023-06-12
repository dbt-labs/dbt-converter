select *
from raw.snowplow_historical.run_model


where _loaded_at > dateadd(d, - 3, current_date)
