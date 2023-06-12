
{{ config(materialized='incremental') }}

select
    'snowpipe' as _source,
    _loaded_at::timestamp_ltz as _loaded_at,

    event_id,
    context:model_id::string as model_id,
    context:model_materialization::string as model_materialization,
    context:hashed_contents::string as hashed_contents,
    context:execution_time::float as execution_time,
    context:index::int as index,
    context:total::int as total,
    context:run_status::string as run_status,
    context:run_skipped::boolean as run_skipped,
    context:run_error::string as run_error,
    context:invocation_id::string as invocation_id,
    context:language::string as language

from {{ ref('current_snowplow_context_splitter') }}
where context_type = 'run_model'

{% if target.name in ['dev', 'default'] %}

    and _loaded_at >= dateadd(d, -{{var('testing_days_of_data')}}, current_date)

{% endif %}

{% if is_incremental() %}

    and _loaded_at >= (select max(_loaded_at) from {{ this }})

{% endif %}
