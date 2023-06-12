

select
    'snowpipe' as _source,
    collector_tstamp::timestamp_ltz as _loaded_at,

    event_id as event_id,
    -- needed for snowplow package
    event_id as root_id,
    collector_tstamp as root_tstamp,

    context:chromeFirstPaint::int as chrome_first_paint,
    context:connectStart::int as connect_start,
    context:connectEnd::int as connect_end,
    context:domComplete::int as dom_complete,
    context:domContentLoadedEventStart::int as dom_content_loaded_event_start,
    context:domContentLoadedEventEnd::int as dom_content_loaded_event_end,
    context:domInteractive::int as dom_interactive,
    context:domLoading::int as dom_loading,
    context:domainLookupStart::int as domain_lookup_start,
    context:domainLookupEnd::int as domain_lookup_end,
    context:fetchStart::int as fetch_start,
    context:loadEventStart::int as load_event_start,
    context:loadEventEnd::int as load_event_end,
    context:navigationStart::int as navigation_start,
    context:redirectStart::int as redirect_start,
    context:redirectEnd::int as redirect_end,
    context:requestStart::int as request_start,
    context:responseStart::int as response_start,
    context:responseEnd::int as response_end,
    context:secureConnectionStart::int as secure_connection_start,
    context:unloadEventStart::int as unload_event_start,
    context:unloadEventEnd::int as unload_event_end

from analytics_dev.dbt_jstein.current_snowplow_context_splitter
where context_type = 'PerformanceTiming'



    and collector_tstamp >= dateadd(d, -3, current_date)





    and collector_tstamp >= (select max(_loaded_at) from analytics_dev.dbt_jstein.current_snowplow_performance_timing)

