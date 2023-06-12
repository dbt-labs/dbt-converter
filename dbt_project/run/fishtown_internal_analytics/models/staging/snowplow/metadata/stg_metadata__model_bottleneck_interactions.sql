begin;
    
        
            delete from analytics_dev.dbt_jstein.stg_metadata__model_bottleneck_interactions
            where (
                event_id) in (
                select (event_id)
                from analytics_dev.dbt_jstein.stg_metadata__model_bottleneck_interactions__dbt_tmp
            );

        
    

    insert into analytics_dev.dbt_jstein.stg_metadata__model_bottleneck_interactions ("_SOURCE", "EVENT_ID", "DATABASE_SOURCE", "ACCOUNT_ID", "TENANT_ACCOUNT_ID", "ENVIRONMENT_ID", "TENANT_ENVIRONMENT_ID", "JOB_DEFINITION_ID", "TENANT_JOB_DEFINITION_ID", "PROJECT_ID", "TENANT_PROJECT_ID", "RUN_ID", "TENANT_RUN_ID", "USER_ID", "TENANT_USER_ID", "INTERACTION_TYPE", "EVENT_AT", "_LOADED_AT")
    (
        select "_SOURCE", "EVENT_ID", "DATABASE_SOURCE", "ACCOUNT_ID", "TENANT_ACCOUNT_ID", "ENVIRONMENT_ID", "TENANT_ENVIRONMENT_ID", "JOB_DEFINITION_ID", "TENANT_JOB_DEFINITION_ID", "PROJECT_ID", "TENANT_PROJECT_ID", "RUN_ID", "TENANT_RUN_ID", "USER_ID", "TENANT_USER_ID", "INTERACTION_TYPE", "EVENT_AT", "_LOADED_AT"
        from analytics_dev.dbt_jstein.stg_metadata__model_bottleneck_interactions__dbt_tmp
    );
    commit;