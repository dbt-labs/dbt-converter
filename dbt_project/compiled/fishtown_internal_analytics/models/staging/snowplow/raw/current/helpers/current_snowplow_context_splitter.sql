

with event as (

    select * from analytics_dev.dbt_jstein.current_snowplow_event

)

select
    event.event_id,
    event.user_id,
    event.collector_tstamp,
    event.event,
    event.event_name,
    event.se_label,
    context.index as context_index,
    REGEXP_SUBSTR(context.value:schema::string, '\/([a-zA-Z_]+)\/jsonschema', 1, 1, 'e') as context_type,
    context.value:data as context

from event,
lateral flatten (input => contexts:data) context

where 1=1
    

    
        and collector_tstamp >= dateadd(d, -3, current_date)
    
    
    
    
        
            and collector_tstamp >= (select max(collector_tstamp) from analytics_dev.dbt_jstein.current_snowplow_context_splitter)
        
    

    
    


