
{{ config(materialized='incremental') }}

select
    'snowpipe' as _source,
    _loaded_at::timestamp_ltz as _loaded_at,
    event_id,
    se_label as invocation_id,
    context:full_reparse_reason::varchar as full_reparse_reason,
    context:traceback::varchar as traceback,
    context:exception::varchar as exception,
    context:code::varchar as code,
    context:location::varchar as location,
    context:parse_file_type::varchar as parse_file_type

from {{ ref('current_snowplow_context_splitter') }}
where context_type = 'partial_parser'

{% if target.name in ['dev', 'default'] %}

    and _loaded_at >= dateadd(d, -{{var('testing_days_of_data')}}, current_date)

{% endif %}

{% if is_incremental() %}

    and _loaded_at >= (select max(_loaded_at) from {{ this }})

{% endif %}
