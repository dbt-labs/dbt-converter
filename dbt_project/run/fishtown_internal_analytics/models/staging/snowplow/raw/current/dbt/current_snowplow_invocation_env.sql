begin;
    

    insert into analytics_dev.dbt_jstein.current_snowplow_invocation_env ("_SOURCE", "_LOADED_AT", "EVENT_ID", "ENVIRONMENT")
    (
        select "_SOURCE", "_LOADED_AT", "EVENT_ID", "ENVIRONMENT"
        from analytics_dev.dbt_jstein.current_snowplow_invocation_env__dbt_tmp
    );
    commit;