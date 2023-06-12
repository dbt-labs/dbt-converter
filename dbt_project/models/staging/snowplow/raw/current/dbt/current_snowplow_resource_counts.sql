
{{ config(materialized='incremental') }}

select
    'snowpipe' as _source,
    _loaded_at::timestamp_ltz as _loaded_at,

    event_id,
    se_label as invocation_id,
    
    context:models::int as models,
    context:tests::int as tests,
    context:snapshots::int as snapshots,
    context:analyses::int as analyses,
    context:macros::int as macros,
    context:operations::int as operations,
    context:seeds::int as seeds,
    context:sources::int as sources,
    context:exposures::int as exposures,
    context:metrics::int as metrics

from {{ ref('current_snowplow_context_splitter') }}
where context_type = 'resource_counts'

{% if target.name in ['dev', 'default'] %}

    and _loaded_at >= dateadd(d, -{{var('testing_days_of_data')}}, current_date)

{% endif %}

{% if is_incremental() %}

    and _loaded_at >= (select max(_loaded_at) from {{ this }})

{% endif %}
