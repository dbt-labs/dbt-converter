begin;
    
        
            delete from analytics_dev.dbt_jstein.stg_semantic_layer__queries
            where (
                event_id) in (
                select (event_id)
                from analytics_dev.dbt_jstein.stg_semantic_layer__queries__dbt_tmp
            );

        
    

    insert into analytics_dev.dbt_jstein.stg_semantic_layer__queries ("_SOURCE", "EVENT_ID", "DATABASE_SOURCE", "ACCOUNT_ID", "TENANT_ACCOUNT_ID", "ENVIRONMENT_ID", "TENANT_ENVIRONMENT_ID", "COMPILE_START", "COMPILE_END", "COMPILE_REQUEST_ID", "CUSTOM_SUBDOMAIN", "HOSTNAME", "IS_COMPILATION_SUCCESSFUL", "QUERY_TYPE", "WAREHOUSE_ACCOUNT_ID", "COLLECTOR_TSTAMP")
    (
        select "_SOURCE", "EVENT_ID", "DATABASE_SOURCE", "ACCOUNT_ID", "TENANT_ACCOUNT_ID", "ENVIRONMENT_ID", "TENANT_ENVIRONMENT_ID", "COMPILE_START", "COMPILE_END", "COMPILE_REQUEST_ID", "CUSTOM_SUBDOMAIN", "HOSTNAME", "IS_COMPILATION_SUCCESSFUL", "QUERY_TYPE", "WAREHOUSE_ACCOUNT_ID", "COLLECTOR_TSTAMP"
        from analytics_dev.dbt_jstein.stg_semantic_layer__queries__dbt_tmp
    );
    commit;