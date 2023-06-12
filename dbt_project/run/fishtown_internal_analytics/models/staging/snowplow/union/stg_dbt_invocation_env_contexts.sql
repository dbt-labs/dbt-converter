begin;
    
        
            delete from analytics_dev.dbt_jstein.stg_dbt_invocation_env_contexts
            where (
                event_id) in (
                select (event_id)
                from analytics_dev.dbt_jstein.stg_dbt_invocation_env_contexts__dbt_tmp
            );

        
    

    insert into analytics_dev.dbt_jstein.stg_dbt_invocation_env_contexts ("_SOURCE", "_LOADED_AT", "EVENT_ID", "ENVIRONMENT")
    (
        select "_SOURCE", "_LOADED_AT", "EVENT_ID", "ENVIRONMENT"
        from analytics_dev.dbt_jstein.stg_dbt_invocation_env_contexts__dbt_tmp
    );
    commit;