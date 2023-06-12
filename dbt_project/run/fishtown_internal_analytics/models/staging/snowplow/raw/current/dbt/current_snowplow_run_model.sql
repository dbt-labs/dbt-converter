begin;
    

    insert into analytics_dev.dbt_jstein.current_snowplow_run_model ("_SOURCE", "_LOADED_AT", "EVENT_ID", "MODEL_ID", "MODEL_MATERIALIZATION", "HASHED_CONTENTS", "EXECUTION_TIME", "INDEX", "TOTAL", "RUN_STATUS", "RUN_SKIPPED", "RUN_ERROR", "INVOCATION_ID", "LANGUAGE")
    (
        select "_SOURCE", "_LOADED_AT", "EVENT_ID", "MODEL_ID", "MODEL_MATERIALIZATION", "HASHED_CONTENTS", "EXECUTION_TIME", "INDEX", "TOTAL", "RUN_STATUS", "RUN_SKIPPED", "RUN_ERROR", "INVOCATION_ID", "LANGUAGE"
        from analytics_dev.dbt_jstein.current_snowplow_run_model__dbt_tmp
    );
    commit;