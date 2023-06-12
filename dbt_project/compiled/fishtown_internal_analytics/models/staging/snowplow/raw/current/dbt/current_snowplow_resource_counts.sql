

select
    'snowpipe' as _source,
    collector_tstamp::timestamp_ltz as _loaded_at,

    event_id,
    se_label as invocation_id,
    
    context:models::int as models,
    context:tests::int as tests,
    context:snapshots::int as snapshots,
    context:analyses::int as analyses,
    context:macros::int as macros,
    context:operations::int as operations,
    context:seeds::int as seeds,
    context:sources::int as sources,
    context:exposures::int as exposures,
    context:metrics::int as metrics

from analytics_dev.dbt_jstein.current_snowplow_context_splitter
where context_type = 'resource_counts'



    and collector_tstamp >= dateadd(d, -3, current_date)





    and collector_tstamp >= (select max(_loaded_at) from analytics_dev.dbt_jstein.current_snowplow_resource_counts)

