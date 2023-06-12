

select
    'snowpipe' as _source,
    collector_tstamp::timestamp_ltz as _loaded_at,

    event_id,
    context:core_project_id::string as project_id,
    context:is_cloud_hosted::boolean as is_cloud_hosted

from analytics_dev.dbt_jstein.current_snowplow_context_splitter
where context_type = 'dbt_docs'    
    

    
        and collector_tstamp >= dateadd(d, -3, current_date)
    
    
    
    
        
            and collector_tstamp >= (select max(_loaded_at) from analytics_dev.dbt_jstein.current_snowplow_dbt_docs)
        
    

    
    


