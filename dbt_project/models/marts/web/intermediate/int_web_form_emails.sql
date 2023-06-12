{{
    config(
        materialized='incremental',
        unique_key='event_id'
    )
}}

with

web_conversions as (

    select * from {{ ref('stg_snowplow_web_events') }}
    where event_name = 'marketing_web_conversions'
        and unstruct_event:data:data:email::string is not null

    {% if is_incremental() %}

        and _loaded_at >= (select max(web_conversion_loaded_at) from {{ this }})

    {% endif %}

),

form_submits as (

    select * from {{ ref('current_snowplow_submit_form') }}

    {% if is_incremental() %}

        where _loaded_at >= (select max(form_submission_loaded_at) from {{ this }})

    {% endif %}

),

form_elements as (

    select * from {{ ref('current_snowplow_submit_form_elements') }}

    {% if is_incremental() %}

        where _loaded_at >= (select max(form_email_loaded_at) from {{ this }})
        
    {% endif %}

),

form_emails as (

    select
        event_id,
        lower(value) as email,
        _loaded_at

    from form_elements
    where name ilike '%email%'
        and value is not null
        and value != ''
    group by 1,2,3

),

joined as (

    select
        form_submits.event_id,
        form_submits.form_id,
        form_submits.domain_userid,
        form_submits.user_id as cloud_user_id,
        form_emails.email,
        form_submits.collector_tstamp,
        form_submits._loaded_at as form_submission_loaded_at,
        form_emails._loaded_at as form_email_loaded_at,
        null as web_conversion_loaded_at
 
    from form_submits
    inner join form_emails
        on form_submits.event_id = form_emails.event_id

),

unioned as (

    select * from joined
    union all
    select
        event_id,
        unstruct_event:data:data:id::string as form_id,
        domain_userid,
        user_id as cloud_user_id,
        unstruct_event:data:data:email::string as email,
        collector_tstamp,
        null as form_submission_loaded_at,
        null as form_email_loaded_at,
        _loaded_at as web_conversion_loaded_at

    from web_conversions

)

select * from unioned