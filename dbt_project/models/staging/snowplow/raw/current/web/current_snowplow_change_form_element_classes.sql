
{{ config(materialized='incremental') }}

select
    'snowpipe' as _source,
    _loaded_at::timestamp_ltz as _loaded_at,

    event_id,
    classes.seq as index,
    classes.value::string as element_classes

from {{ ref('current_snowplow_unstruct_event_splitter') }},
lateral flatten (input => unstruct_event:elementClasses) classes
where event_name = 'change_form'

{% if target.name in ['dev', 'default'] %}

    and _loaded_at >= dateadd(d, -{{var('testing_days_of_data')}}, current_date)

{% endif %}

{% if is_incremental() %}

    and _loaded_at >= (select max(_loaded_at) from {{ this }})

{% endif %}
