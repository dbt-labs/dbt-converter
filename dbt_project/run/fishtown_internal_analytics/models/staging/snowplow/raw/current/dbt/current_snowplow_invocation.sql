begin;
    

    insert into analytics_dev.dbt_jstein.current_snowplow_invocation ("_SOURCE", "_LOADED_AT", "EVENT_ID", "RUN_TYPE", "USER_ID", "COMMAND", "RESULT", "VERSION", "REMOTE_IP", "RESULT_TYPE", "PROJECT_ID", "COMMAND_OPTIONS", "PROGRESS", "INVOCATION_ID", "ADAPTER_TYPE", "ADAPTER_UNIQUE_ID")
    (
        select "_SOURCE", "_LOADED_AT", "EVENT_ID", "RUN_TYPE", "USER_ID", "COMMAND", "RESULT", "VERSION", "REMOTE_IP", "RESULT_TYPE", "PROJECT_ID", "COMMAND_OPTIONS", "PROGRESS", "INVOCATION_ID", "ADAPTER_TYPE", "ADAPTER_UNIQUE_ID"
        from analytics_dev.dbt_jstein.current_snowplow_invocation__dbt_tmp
    );
    commit;