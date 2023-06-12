{{
    config(
        materialized='incremental',
        unique_key='event_id'
    )
}}

with

semantic_layer_queries as (

    select * from {{ ref('stg_semantic_layer__queries') }}
    where 1=1

    {% if target.name in ['dev', 'default'] %}

        and _loaded_at >= dateadd(d, -{{var('testing_days_of_data')}}, current_date)
    
    {% endif %}
    
    {% if is_incremental() %}

        and _loaded_at >= (select max(_loaded_at) from {{ this }})

    {% endif %}

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

        collector_tstamp as queried_at,
        _loaded_at

    from semantic_layer_queries

)

select * from final