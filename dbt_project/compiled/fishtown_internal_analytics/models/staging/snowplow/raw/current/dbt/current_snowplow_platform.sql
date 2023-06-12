

select
    'snowpipe' as _source,
    collector_tstamp::timestamp_ltz as _loaded_at,

    event_id,
    context:python_version::string as python_version,
    context:platform::string as platform,
    context:python::string as python

from analytics_dev.dbt_jstein.current_snowplow_context_splitter
where context_type = 'platform'



    and collector_tstamp >= dateadd(d, -3, current_date)





    and collector_tstamp >= (select max(_loaded_at) from analytics_dev.dbt_jstein.current_snowplow_platform)

