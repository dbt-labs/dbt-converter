begin;
    
        
            delete from analytics_dev.dbt_jstein.fct_semantic_layer_queries
            where (
                event_id) in (
                select (event_id)
                from analytics_dev.dbt_jstein.fct_semantic_layer_queries__dbt_tmp
            );

        
    

    insert into analytics_dev.dbt_jstein.fct_semantic_layer_queries ("EVENT_ID", "DATABASE_SOURCE", "ACCOUNT_ID", "TENANT_ACCOUNT_ID", "ENVIRONMENT_ID", "TENANT_ENVIRONMENT_ID", "COMPILE_REQUEST_ID", "COMPILE_START", "COMPILE_END", "CUSTOM_SUBDOMAIN", "HOSTNAME", "IS_COMPILATION_SUCCESSFUL", "QUERY_TYPE", "IS_ACTIVE_SEMANTIC_LAYER_USAGE", "WAREHOUSE_ACCOUNT_ID", "QUERIED_AT")
    (
        select "EVENT_ID", "DATABASE_SOURCE", "ACCOUNT_ID", "TENANT_ACCOUNT_ID", "ENVIRONMENT_ID", "TENANT_ENVIRONMENT_ID", "COMPILE_REQUEST_ID", "COMPILE_START", "COMPILE_END", "CUSTOM_SUBDOMAIN", "HOSTNAME", "IS_COMPILATION_SUCCESSFUL", "QUERY_TYPE", "IS_ACTIVE_SEMANTIC_LAYER_USAGE", "WAREHOUSE_ACCOUNT_ID", "QUERIED_AT"
        from analytics_dev.dbt_jstein.fct_semantic_layer_queries__dbt_tmp
    );
    commit;