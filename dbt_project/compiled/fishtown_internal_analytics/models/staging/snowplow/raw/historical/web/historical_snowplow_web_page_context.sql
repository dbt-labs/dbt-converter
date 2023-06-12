select *
from raw.snowplow_historical.web_page


where _loaded_at > dateadd(d, - 3, current_date)
