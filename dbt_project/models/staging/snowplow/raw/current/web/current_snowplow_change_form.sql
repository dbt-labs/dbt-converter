
{{ config(materialized='incremental') }}

select
    'snowpipe' as _source,
    _loaded_at::timestamp_ltz as _loaded_at,

    event_id,
    unstruct_event:elementId::string as element_id,
    unstruct_event:formId::string as form_id,
    unstruct_event:nodeName::string as node_name,
    unstruct_event:type::string as type,
    unstruct_event:value::string as value

from {{ ref('current_snowplow_unstruct_event_splitter') }}
where event_name = 'change_form'

{% if target.name in ['dev', 'default'] %}

    and _loaded_at >= dateadd(d, -{{var('testing_days_of_data')}}, current_date)

{% endif %}

{% if is_incremental() %}

    and _loaded_at >= (select max(_loaded_at) from {{ this }})

{% endif %}
