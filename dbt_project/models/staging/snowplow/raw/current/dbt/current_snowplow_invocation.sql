
{{ config(materialized='incremental') }}

select
    'snowpipe' as _source,
    _loaded_at::timestamp_ltz as _loaded_at,

    event_id,
    context:run_type::string as run_type,
    context:user_id::string as user_id,
    context:command::string as command,
    context:result::string as result,
    context:version::string as version,
    null::string as remote_ip,
    context:result_type::string as result_type,
    context:options::string as command_options,
    context:progress::string as progress,
    context:invocation_id::string as invocation_id,

    -- available here for dbt-core<=1.4, and in separate events for dbt-core>=1.5
    context:project_id::string as project_id,
    context:adapter_type::string as adapter_type,
    context:adapter_unique_id::string as adapter_unique_id

from {{ ref('current_snowplow_context_splitter') }}
where context_type = 'invocation'

{% if target.name in ['dev', 'default'] %}

  and _loaded_at >= dateadd(d, -{{var('testing_days_of_data')}}, current_date)

{% endif %}

{% if is_incremental() %}

  and _loaded_at >= (select max(_loaded_at) from {{ this }})

{% endif %}
