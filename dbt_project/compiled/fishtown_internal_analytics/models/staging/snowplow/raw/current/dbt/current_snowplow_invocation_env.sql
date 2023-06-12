

select
    'snowpipe' as _source,
    collector_tstamp::timestamp_ltz as _loaded_at,

    event_id,
    context:environment::string as environment

from analytics_dev.dbt_jstein.current_snowplow_context_splitter
where context_type = 'invocation_env'



    and collector_tstamp >= dateadd(d, -3, current_date)





    and collector_tstamp >= (select max(_loaded_at) from analytics_dev.dbt_jstein.current_snowplow_invocation_env)

