select *
from raw.snowplow_historical.submit_form


where _loaded_at > dateadd(d, -3, current_date)
