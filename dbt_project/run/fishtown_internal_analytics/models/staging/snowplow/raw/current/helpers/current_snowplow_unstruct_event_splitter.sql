begin;
    
        
            delete from analytics_dev.dbt_jstein.current_snowplow_unstruct_event_splitter
            where (
                event_id) in (
                select (event_id)
                from analytics_dev.dbt_jstein.current_snowplow_unstruct_event_splitter__dbt_tmp
            );

        
    

    insert into analytics_dev.dbt_jstein.current_snowplow_unstruct_event_splitter ("EVENT_ID", "DOMAIN_USERID", "USER_ID", "DOMAIN_SESSIONID", "DATABASE_SOURCE", "COLLECTOR_TSTAMP", "DERIVED_TSTAMP", "EVENT", "EVENT_NAME", "UNSTRUCT_EVENT")
    (
        select "EVENT_ID", "DOMAIN_USERID", "USER_ID", "DOMAIN_SESSIONID", "DATABASE_SOURCE", "COLLECTOR_TSTAMP", "DERIVED_TSTAMP", "EVENT", "EVENT_NAME", "UNSTRUCT_EVENT"
        from analytics_dev.dbt_jstein.current_snowplow_unstruct_event_splitter__dbt_tmp
    );
    commit;