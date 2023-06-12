

 with learn_events as (

    select * from raw.snowplow.event
    where collector_tstamp::date >= (current_date - interval '14 day')
      and page_urlhost = 'www.getdbt.com'
      and page_urlpath like '/dbt-learn/lessons%'
      and event in ('page_ping', 'page_view')

),

limited as (

    select

        -- subset of fields, none of which contains PII
        -- IDs
        learn_events.event_id,
        web_page_context.value:data.id::varchar as page_view_id,
        learn_events.domain_userid as anonymous_user_id,
        learn_events.domain_sessionid as session_id,

        -- atributes
        learn_events.event,
        learn_events.dvce_type as device_type,

        -- page attributes
        learn_events.page_url,
        learn_events.page_title,
        learn_events.page_urlscheme,
        learn_events.page_urlhost,
        learn_events.page_urlport,
        learn_events.page_urlpath,
        learn_events.page_urlquery,
        learn_events.page_urlfragment,

        -- timestamps
        learn_events.collector_tstamp,
        learn_events.derived_tstamp

    from learn_events,
    lateral flatten (input => parse_json(contexts):data) as web_page_context

)

select * from limited