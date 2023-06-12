
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
    unstruct_event:formId::string as form_id,
    collector_tstamp,
    _loaded_at

from {{ ref('current_snowplow_unstruct_event_splitter') }}
where event_name = 'submit_form'

{% if target.name in ['dev', 'default'] %}

    and _loaded_at >= dateadd(d, -{{var('testing_days_of_data')}}, current_date)

{% endif %}

{% if is_incremental() %}

    and _loaded_at >= (select max(_loaded_at) from {{ this }})

{% endif %}
