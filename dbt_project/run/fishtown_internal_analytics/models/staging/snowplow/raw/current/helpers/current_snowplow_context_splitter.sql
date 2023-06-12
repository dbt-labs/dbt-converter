begin;
    
        
            delete from analytics_dev.dbt_jstein.current_snowplow_context_splitter
            where (
                event_id) in (
                select (event_id)
                from analytics_dev.dbt_jstein.current_snowplow_context_splitter__dbt_tmp
            );

        
    

    insert into analytics_dev.dbt_jstein.current_snowplow_context_splitter ("EVENT_ID", "USER_ID", "COLLECTOR_TSTAMP", "EVENT", "EVENT_NAME", "SE_LABEL", "CONTEXT_INDEX", "CONTEXT_TYPE", "CONTEXT")
    (
        select "EVENT_ID", "USER_ID", "COLLECTOR_TSTAMP", "EVENT", "EVENT_NAME", "SE_LABEL", "CONTEXT_INDEX", "CONTEXT_TYPE", "CONTEXT"
        from analytics_dev.dbt_jstein.current_snowplow_context_splitter__dbt_tmp
    );
    commit;