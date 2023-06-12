begin;
    

    insert into analytics_dev.dbt_jstein.current_snowplow_platform ("_SOURCE", "_LOADED_AT", "EVENT_ID", "PYTHON_VERSION", "PLATFORM", "PYTHON")
    (
        select "_SOURCE", "_LOADED_AT", "EVENT_ID", "PYTHON_VERSION", "PLATFORM", "PYTHON"
        from analytics_dev.dbt_jstein.current_snowplow_platform__dbt_tmp
    );
    commit;