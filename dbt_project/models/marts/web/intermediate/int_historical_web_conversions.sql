{{
    config(
        materialized = 'incremental',
        unique_key = 'event_id'
    )
}}

with

events as (

    select * from {{ ref('stg_snowplow_web_events') }}

    -- this date marks when we started including `marketing_web_conversions` events in Snowplow
    where collector_tstamp::date < to_date('2021-11-18')
    
    {% if is_incremental() %}
        and collector_tstamp > (select max(converted_at) from {{ this }})
    {% endif %}
),

web_page_context as (

    select * from {{ ref('snowplow_web_page_context') }}

),

form_submits as (

    select * from {{ref('current_snowplow_submit_form')}}

    where collector_tstamp::date < to_date('2021-11-18')

    {% if is_incremental() %}
        and collector_tstamp > (select max(converted_at) from {{ this }})
    
    {% endif %}

),

sessions as (

    select * from {{ ref('int_snowplow_sessions') }}

    where session_start::date < to_date('2021-11-18')

    {% if is_incremental() %}
        and session_start > (select max(converted_at) from {{ this }})
    
    {% endif %}

),

conversions as (

    select distinct
        domain_sessionid as session_id,
        page_url,
        coalesce(form_submits.form_id,nullif(events.se_category,''),events.page_urlpath) as conversion_id,
        event_id,
        event_name,
        unstruct_event,
        derived_tstamp as converted_at

    from events
    left join form_submits using (event_id)
    where form_submits.form_id ilike any (
        'signup',
        'hsForm_338d9df1-3364-484a-88b8-254e5541ea52',
        'hsForm_6d63bf7c-a12f-4820-aff3-a5812298c94e',
        'hsForm_f01a904c-1dfb-4f93-b72a-9aac5e2f894b',
        'checkout_sign_up_%'
    )
        or (events.page_url ilike '%coalesce.getdbt.com/checkout/order-complete/%' and event_name = 'page_view')
        or events.se_category = 'slack-signup'

),

joined as (

    select

        conversions.event_id,
        conversions.session_id,
        web_page_context.page_view_id,
        sessions.inferred_user_id,
        sessions.cloud_user_id,
        sessions.salesforce_contact_id,
        conversions.conversion_id,

        case
            when conversions.conversion_id = 'signup'
                then 'register_cloud'
            when conversions.conversion_id = 'hsForm_338d9df1-3364-484a-88b8-254e5541ea52'
                then 'download_business-case-guide'
            when conversions.conversion_id = 'hsForm_6d63bf7c-a12f-4820-aff3-a5812298c94e'
                then 'contact_contact-sales'
            when conversions.conversion_id = 'hsForm_f01a904c-1dfb-4f93-b72a-9aac5e2f894b'
                then 'download_analytics-engineering-guide'
            when conversions.conversion_id ilike 'checkout_sign_up_%'
                then 'register_on-demand-learn'
            when conversions.conversion_id ilike '%/checkout/order-complete/%'
                then 'register_coalesce'
            when conversions.conversion_id = 'slack-signup'
                then 'register_community'
        end as conversion_name,

        conversions.event_name as conversion_type,
        conversions.unstruct_event,
        conversions.converted_at

    from conversions
    left join sessions using (session_id)
    left join web_page_context
        on conversions.event_id = web_page_context.root_id

)

select * from joined