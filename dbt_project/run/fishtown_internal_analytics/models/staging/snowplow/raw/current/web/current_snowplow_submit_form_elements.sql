begin;
    
        
            delete from analytics_dev.dbt_jstein.current_snowplow_submit_form_elements
            where (
                event_id) in (
                select (event_id)
                from analytics_dev.dbt_jstein.current_snowplow_submit_form_elements__dbt_tmp
            );

        
    

    insert into analytics_dev.dbt_jstein.current_snowplow_submit_form_elements ("_SOURCE", "EVENT_ID", "DOMAIN_USERID", "USER_ID", "DOMAIN_SESSIONID", "NAME", "VALUE", "INDEX", "NODENAME", "TYPE", "COLLECTOR_TSTAMP")
    (
        select "_SOURCE", "EVENT_ID", "DOMAIN_USERID", "USER_ID", "DOMAIN_SESSIONID", "NAME", "VALUE", "INDEX", "NODENAME", "TYPE", "COLLECTOR_TSTAMP"
        from analytics_dev.dbt_jstein.current_snowplow_submit_form_elements__dbt_tmp
    );
    commit;