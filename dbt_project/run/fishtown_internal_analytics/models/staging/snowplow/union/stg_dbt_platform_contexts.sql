begin;
    
        
            delete from analytics_dev.dbt_jstein.stg_dbt_platform_contexts
            where (
                event_id) in (
                select (event_id)
                from analytics_dev.dbt_jstein.stg_dbt_platform_contexts__dbt_tmp
            );

        
    

    insert into analytics_dev.dbt_jstein.stg_dbt_platform_contexts ("_SOURCE", "_LOADED_AT", "EVENT_ID", "PYTHON_VERSION", "PLATFORM", "PYTHON")
    (
        select "_SOURCE", "_LOADED_AT", "EVENT_ID", "PYTHON_VERSION", "PLATFORM", "PYTHON"
        from analytics_dev.dbt_jstein.stg_dbt_platform_contexts__dbt_tmp
    );
    commit;