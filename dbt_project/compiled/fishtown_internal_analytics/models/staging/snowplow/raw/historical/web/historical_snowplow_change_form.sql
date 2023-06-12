select *
from raw.snowplow_historical.change_form


where _loaded_at > dateadd(d, -3, current_date)
