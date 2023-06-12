
select *,
    null::string as adapter_type,
    null::string as adapter_unique_id

from {{ source('snowplow_historical', 'invocation') }}

{% if target.name in ['dev', 'default'] %}
where _loaded_at > dateadd(d, - {{ var('testing_days_of_data') }}, current_date)
{% endif %}

