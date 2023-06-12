{{ config(materialized='incremental') }}

select
    'snowpipe' as _source,
    _loaded_at::timestamp_ltz as _loaded_at,

    event_id,
    context:environment::string as environment

from {{ ref('current_snowplow_context_splitter') }}
where context_type = 'invocation_env'

{% if target.name in ['dev', 'default'] %}

    and _loaded_at >= dateadd(d, -{{var('testing_days_of_data')}}, current_date)

{% endif %}

{% if is_incremental() %}

    and _loaded_at >= (select max(_loaded_at) from {{ this }})

{% endif %}