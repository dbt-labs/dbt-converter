
select *
from {{ source('snowplow_historical', 'event') }}

{% if target.name in ['dev', 'default'] %}
where _loaded_at > dateadd(d, - {{ var('testing_days_of_data') }}, current_date)
{% endif %}
