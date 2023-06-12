

select
    'snowpipe' as _source,
    collector_tstamp::timestamp_ltz as _loaded_at,

    event_id as event_id,
    context:id::string as id

from analytics_dev.dbt_jstein.current_snowplow_context_splitter
where context_type = 'web_page'



    and collector_tstamp >= dateadd(d, -3, current_date)





    and collector_tstamp >= (select max(_loaded_at) from analytics_dev.dbt_jstein.current_snowplow_web_page)

