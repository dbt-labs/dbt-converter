{{
    config(
        materialized = 'incremental',
        unique_key = 'event_id'
    )
}}

with

events as (

    select * from {{ ref('stg_snowplow_web_events') }}

    where event_name = 'marketing_web_conversions'
        -- this date marks when we started including `marketing_web_conversions` events in Snowplow
        and collector_tstamp::date >= to_date('2021-11-18')

    {% if is_incremental() %}
        -- the 3 day offset is required to make sure we include any late-arriving facts
        and collector_tstamp > dateadd(day, -3, (select max(converted_at) from {{ this }}))

    {% endif %}

),

web_page_context as (

    select * from {{ ref('snowplow_web_page_context') }}

),

sessions as (

    select * from {{ ref('int_snowplow_sessions') }}

    where session_start::date >= to_date('2021-11-18')

    {% if is_incremental() %}
        -- the 3 day offest is required to make sure our Snowplow ID map
        -- has the chance to populate values in int_snowplow_sessions
        -- this usually takes a couple of hours for net-new users
        -- since we are syncing these people to Salesforce and then back into our warehouse
        and session_start > dateadd(day, -3, (select max(converted_at) from {{ this }}))
    
    {% endif %}

),

conversions as (

    select
        event_id,
        domain_sessionid as session_id,
        unstruct_event:data:data:id::string as conversion_id,
        unstruct_event:data:data:name::string as conversion_name,
        unstruct_event:data:data:type::string as conversion_type,
        unstruct_event,
        derived_tstamp as converted_at
    
    from events

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
        conversions.conversion_name,
        conversions.conversion_type,
        conversions.unstruct_event,
        conversions.converted_at
    
    from conversions
    left join sessions using (session_id)
    left join web_page_context
        on conversions.event_id = web_page_context.root_id

)

select * from joined