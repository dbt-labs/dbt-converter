begin;
    
        
            delete from analytics_dev.dbt_jstein.stg_metadata_api__requests
            where (
                event_id) in (
                select (event_id)
                from analytics_dev.dbt_jstein.stg_metadata_api__requests__dbt_tmp
            );

        
    

    insert into analytics_dev.dbt_jstein.stg_metadata_api__requests ("_SOURCE", "EVENT_ID", "DATABASE_SOURCE", "ACCOUNT_ID", "JOB_DEFINITION_ID", "USER_ID", "SOURCE", "SOURCE_BUCKETS", "USER_AGENT", "CREATED_AT", "_LOADED_AT")
    (
        select "_SOURCE", "EVENT_ID", "DATABASE_SOURCE", "ACCOUNT_ID", "JOB_DEFINITION_ID", "USER_ID", "SOURCE", "SOURCE_BUCKETS", "USER_AGENT", "CREATED_AT", "_LOADED_AT"
        from analytics_dev.dbt_jstein.stg_metadata_api__requests__dbt_tmp
    );
    commit;