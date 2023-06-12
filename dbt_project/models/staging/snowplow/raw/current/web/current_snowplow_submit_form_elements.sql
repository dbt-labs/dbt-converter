
{{
    config(
        materialized='incremental',
        unique_key='event_id'
    )
}}

select
    'snowpipe' as _source,

    event_id,
    domain_userid,
    user_id,
    domain_sessionid,
    elements.value:name::string as name,
    elements.value:value::string as value,
    elements.seq as index,
    elements.value:nodeName::string as nodename,
    elements.value:type::string as type,

    collector_tstamp,
    _loaded_at

from {{ ref('current_snowplow_unstruct_event_splitter') }},
lateral flatten (input => unstruct_event:elements) elements
where event_name = 'submit_form'

{% if target.name in ['dev', 'default'] %}

    and _loaded_at >= dateadd(d, -{{var('testing_days_of_data')}}, current_date)

{% endif %}

{% if is_incremental() %}

    and _loaded_at >= (select max(_loaded_at) from {{ this }})

{% endif %}
