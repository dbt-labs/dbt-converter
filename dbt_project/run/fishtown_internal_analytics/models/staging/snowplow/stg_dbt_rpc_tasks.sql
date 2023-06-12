begin;
    
        
            delete from analytics_dev.dbt_jstein.stg_dbt_rpc_tasks
            where (
                event_id) in (
                select (event_id)
                from analytics_dev.dbt_jstein.stg_dbt_rpc_tasks__dbt_tmp
            );

        
    

    insert into analytics_dev.dbt_jstein.stg_dbt_rpc_tasks ("_SOURCE", "_LOADED_AT", "EVENT_ID", "INVOCATION_ID", "TASK_TYPE", "REQUEST_AT")
    (
        select "_SOURCE", "_LOADED_AT", "EVENT_ID", "INVOCATION_ID", "TASK_TYPE", "REQUEST_AT"
        from analytics_dev.dbt_jstein.stg_dbt_rpc_tasks__dbt_tmp
    );
    commit;