begin;
    
        
            delete from analytics_dev.dbt_jstein.current_snowplow_submit_form
            where (
                event_id) in (
                select (event_id)
                from analytics_dev.dbt_jstein.current_snowplow_submit_form__dbt_tmp
            );

        
    

    insert into analytics_dev.dbt_jstein.current_snowplow_submit_form ("_SOURCE", "EVENT_ID", "DOMAIN_USERID", "USER_ID", "DOMAIN_SESSIONID", "FORM_ID", "COLLECTOR_TSTAMP")
    (
        select "_SOURCE", "EVENT_ID", "DOMAIN_USERID", "USER_ID", "DOMAIN_SESSIONID", "FORM_ID", "COLLECTOR_TSTAMP"
        from analytics_dev.dbt_jstein.current_snowplow_submit_form__dbt_tmp
    );
    commit;