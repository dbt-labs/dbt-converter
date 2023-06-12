select *
from raw.snowplow_historical.link_click


where _loaded_at > dateadd(d, -3, current_date)
