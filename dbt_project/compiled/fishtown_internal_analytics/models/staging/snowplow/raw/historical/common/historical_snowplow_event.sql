select *
from raw.snowplow_historical.event


where _loaded_at > dateadd(d, - 3, current_date)
