begin;
    
        
            delete from analytics_dev.dbt_jstein.stg_snowplow_web_experiment_contexts
            where (
                event_id) in (
                select (event_id)
                from analytics_dev.dbt_jstein.stg_snowplow_web_experiment_contexts__dbt_tmp
            );

        
    

    insert into analytics_dev.dbt_jstein.stg_snowplow_web_experiment_contexts ("EVENT_ID", "USER_ID", "COLLECTOR_TSTAMP", "EVENT", "EVENT_NAME", "SE_LABEL", "CONTEXT_INDEX", "CONTEXT_TYPE", "CONTEXT", "EXPERIMENT_NAME", "BRANCH_NAME")
    (
        select "EVENT_ID", "USER_ID", "COLLECTOR_TSTAMP", "EVENT", "EVENT_NAME", "SE_LABEL", "CONTEXT_INDEX", "CONTEXT_TYPE", "CONTEXT", "EXPERIMENT_NAME", "BRANCH_NAME"
        from analytics_dev.dbt_jstein.stg_snowplow_web_experiment_contexts__dbt_tmp
    );
    commit;