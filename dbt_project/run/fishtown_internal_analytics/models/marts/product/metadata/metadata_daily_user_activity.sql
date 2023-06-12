begin;
    
        
            delete from analytics_dev.dbt_jstein.metadata_daily_user_activity
            where (
                id) in (
                select (id)
                from analytics_dev.dbt_jstein.metadata_daily_user_activity__dbt_tmp
            );

        
    

    insert into analytics_dev.dbt_jstein.metadata_daily_user_activity ("ACCOUNT_ID", "USER_ID", "EVENT_DATE", "ID", "TOTAL_METADATA_API_REQUESTS", "TOTAL_EXTERNAL_METADATA_API_REQUESTS", "SOURCE_COUNT", "FIRST_METADATA_API_REQUESTS_AT", "LAST_METADATA_API_REQUESTS_AT", "TOTAL_MODEL_BOTTLENECK_VIZ_EVENTS", "FIRST_MODEL_BOTTLENECK_VIZ_AT", "LAST_MODEL_BOTTLENECK_VIZ_AT")
    (
        select "ACCOUNT_ID", "USER_ID", "EVENT_DATE", "ID", "TOTAL_METADATA_API_REQUESTS", "TOTAL_EXTERNAL_METADATA_API_REQUESTS", "SOURCE_COUNT", "FIRST_METADATA_API_REQUESTS_AT", "LAST_METADATA_API_REQUESTS_AT", "TOTAL_MODEL_BOTTLENECK_VIZ_EVENTS", "FIRST_MODEL_BOTTLENECK_VIZ_AT", "LAST_MODEL_BOTTLENECK_VIZ_AT"
        from analytics_dev.dbt_jstein.metadata_daily_user_activity__dbt_tmp
    );
    commit;