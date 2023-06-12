begin;
    
        
            delete from analytics_dev.dbt_jstein.current_snowplow_dbt_docs
            where (
                event_id) in (
                select (event_id)
                from analytics_dev.dbt_jstein.current_snowplow_dbt_docs__dbt_tmp
            );

        
    

    insert into analytics_dev.dbt_jstein.current_snowplow_dbt_docs ("_SOURCE", "_LOADED_AT", "EVENT_ID", "PROJECT_ID", "IS_CLOUD_HOSTED")
    (
        select "_SOURCE", "_LOADED_AT", "EVENT_ID", "PROJECT_ID", "IS_CLOUD_HOSTED"
        from analytics_dev.dbt_jstein.current_snowplow_dbt_docs__dbt_tmp
    );
    commit;