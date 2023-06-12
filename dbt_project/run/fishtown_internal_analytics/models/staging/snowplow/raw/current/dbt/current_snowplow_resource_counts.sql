begin;
    

    insert into analytics_dev.dbt_jstein.current_snowplow_resource_counts ("_SOURCE", "_LOADED_AT", "EVENT_ID", "INVOCATION_ID", "MODELS", "TESTS", "SNAPSHOTS", "ANALYSES", "MACROS", "OPERATIONS", "SEEDS", "SOURCES", "EXPOSURES", "METRICS")
    (
        select "_SOURCE", "_LOADED_AT", "EVENT_ID", "INVOCATION_ID", "MODELS", "TESTS", "SNAPSHOTS", "ANALYSES", "MACROS", "OPERATIONS", "SEEDS", "SOURCES", "EXPOSURES", "METRICS"
        from analytics_dev.dbt_jstein.current_snowplow_resource_counts__dbt_tmp
    );
    commit;