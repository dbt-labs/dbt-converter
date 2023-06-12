

with

semantic_layer_queries as (

    select * from analytics_dev.dbt_jstein.stg_semantic_layer__queries
    where 1=1

    

        and collector_tstamp >= dateadd(d, -3, current_date)
    
    
    
    

        and collector_tstamp >= (select max(queried_at) from analytics_dev.dbt_jstein.fct_semantic_layer_queries)

    

),

final as (

    select
        event_id,
        database_source,
        account_id,
        tenant_account_id,
        environment_id,
        tenant_environment_id,    
        compile_request_id,
        compile_start,
        compile_end,
        custom_subdomain,
        hostname,
        is_compilation_successful,
        query_type,

        query_type = 'dbt_sql' 
        and is_compilation_successful as is_active_semantic_layer_usage,

        warehouse_account_id,

        collector_tstamp as queried_at

    from semantic_layer_queries

)

select * from final