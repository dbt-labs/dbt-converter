select *
from raw.snowplow_historical.platform


where _loaded_at > dateadd(d, - 3, current_date)
