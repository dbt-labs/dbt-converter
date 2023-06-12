
{{ config(materialized='incremental') }}

select
    'snowpipe' as _source,
    _loaded_at::timestamp_ltz as _loaded_at,

    event_id,
    se_label as invocation_id,

    -- for dbt-core>=1.5
    context:adapter_type::string as adapter_type,
    context:adapter_unique_id::string as adapter_unique_id

from {{ ref('current_snowplow_context_splitter') }}
where context_type = 'adapter_info'

{% if target.name in ['dev', 'default'] %}

  and _loaded_at >= dateadd(d, -{{var('testing_days_of_data')}}, current_date)

{% endif %}

{% if is_incremental() %}

  and _loaded_at >= (select max(_loaded_at) from {{ this }})

{% endif %}
