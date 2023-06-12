begin;
    
        
            delete from analytics_dev.dbt_jstein.stg_dbt_run_model_contexts
            where (
                event_id) in (
                select (event_id)
                from analytics_dev.dbt_jstein.stg_dbt_run_model_contexts__dbt_tmp
            );

        
    

    insert into analytics_dev.dbt_jstein.stg_dbt_run_model_contexts ("_SOURCE", "_LOADED_AT", "EVENT_ID", "MODEL_ID", "MODEL_MATERIALIZATION", "HASHED_CONTENTS", "EXECUTION_TIME", "INDEX", "TOTAL", "RUN_STATUS", "RUN_SKIPPED", "RUN_ERROR", "INVOCATION_ID", "LANGUAGE")
    (
        select "_SOURCE", "_LOADED_AT", "EVENT_ID", "MODEL_ID", "MODEL_MATERIALIZATION", "HASHED_CONTENTS", "EXECUTION_TIME", "INDEX", "TOTAL", "RUN_STATUS", "RUN_SKIPPED", "RUN_ERROR", "INVOCATION_ID", "LANGUAGE"
        from analytics_dev.dbt_jstein.stg_dbt_run_model_contexts__dbt_tmp
    );
    commit;