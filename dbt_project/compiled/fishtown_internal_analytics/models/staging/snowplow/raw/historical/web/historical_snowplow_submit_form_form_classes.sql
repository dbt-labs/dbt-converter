select *
from raw.snowplow_historical.submit_form_elements


where _loaded_at > dateadd(d, -3, current_date)
