

with

snowplow_context as (

    select * from analytics_dev.dbt_jstein.current_snowplow_context_splitter

),

final as (

    select
        'snowpipe' as _source,
        collector_tstamp::timestamp_ltz as _loaded_at,
        
        event_id,
        se_label as invocation_id,
        context:task::string as task_type,
        collector_tstamp as request_at

    from snowplow_context

    where context_type = 'rpc_request'
        and task_type in (
            'run',
            'test',
            'docs.generate',
            'deps',
            'seed',
            'snapshot',
            'compile'
        )

    

        and collector_tstamp >= dateadd(d, -3, current_date)

    

    

        and collector_tstamp >= (select max(_loaded_at) from analytics_dev.dbt_jstein.stg_dbt_rpc_tasks)

    

)

select * from final