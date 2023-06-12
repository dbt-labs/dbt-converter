

select
    'snowpipe' as _source,
    collector_tstamp::timestamp_ltz as _loaded_at,

    event_id,
    context:run_type::string as run_type,
    context:user_id::string as user_id,
    context:command::string as command,
    context:result::string as result,
    context:version::string as version,
    null::string as remote_ip,
    context:result_type::string as result_type,
    context:project_id::string as project_id,
    context:options::string as command_options,
    context:progress::string as progress,
    context:invocation_id::string as invocation_id,
    context:adapter_type::string as adapter_type,
    context:adapter_unique_id::string as adapter_unique_id

from analytics_dev.dbt_jstein.current_snowplow_context_splitter
where context_type = 'invocation'



  and collector_tstamp >= dateadd(d, -3, current_date)





  and collector_tstamp >= (select max(_loaded_at) from analytics_dev.dbt_jstein.current_snowplow_invocation)

