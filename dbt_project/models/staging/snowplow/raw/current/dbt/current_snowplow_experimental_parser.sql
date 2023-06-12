
{{ config(materialized='incremental') }}

select
    'snowpipe' as _source,
    _loaded_at::timestamp_ltz as _loaded_at,

    event_id,
    se_label as invocation_id,
    context:project_id::varchar as project_id,
    
    context:file_id::varchar as file_id,
    to_array(context:status) as parser_status_array

from {{ ref('current_snowplow_context_splitter') }}
where context_type = 'experimental_parser'

{% if target.name in ['dev', 'default'] %}

    and _loaded_at >= dateadd(d, -{{var('testing_days_of_data')}}, current_date)

{% endif %}

{% if is_incremental() %}

    and _loaded_at >= (select max(_loaded_at) from {{ this }})

{% endif %}
