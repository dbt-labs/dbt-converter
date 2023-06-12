with

source as (

    select * from {{ source('snowflake_account_usage', 'query_history') }}
    where start_time::date > {{ dateadd('month', -6, 'current_date') }}
        and warehouse_size is not null  -- Only queries that require compute
        and execution_status = 'SUCCESS'  -- Only successful queries
        and user_name = 'DBT_CLOUD_USER'  -- Only queries related to production dbt runs

),

parse_query_tags as (

    select
        *,
        try_parse_json(query_tag):dbt_run_id::string as dbt_cloud_run_id,
        try_parse_json(query_tag):dbt_job_id::string as dbt_cloud_job_id,
        try_parse_json(query_tag):dbt_model_name::string as dbt_model_name,
        try_parse_json(query_tag):dbt_project_name::string as dbt_project_name,
        try_parse_json(query_tag):dbt_environment_name::string as dbt_cloud_environment_name,
        try_parse_json(query_tag):dbt_run_reason::string as dbt_run_reason,
        try_parse_json(query_tag):dbt_materialization_type::string as dbt_materialization_type,
        try_parse_json(query_tag):dbt_user_name::string as dbt_user_name,
        try_parse_json(query_tag):dbt_incremental_full_refresh::boolean as is_incremental_full_refresh,
        try_parse_json(query_tag):dbt_is_cold_storage_refresh::boolean as is_cold_storage_refresh

    from source

),

final as (

    select
        query_id,
        session_id,
        database_id,
        schema_id,
        warehouse_id,
        
        dbt_cloud_run_id,
        dbt_cloud_job_id,

        dbt_project_name,
        dbt_model_name,
        dbt_cloud_environment_name,
        dbt_user_name,

        database_name,
        schema_name,
        user_name,
        role_name,
        
        warehouse_name,
        warehouse_size,
        -- Supports ranking by warehouse size downstream
        case
            when warehouse_size = 'X-Small'
                then '1 - XS'
            when warehouse_size = 'Small'
                then '2 - S'
            when warehouse_size = 'Medium'
                then '3 - M'
            when warehouse_size = 'Large'
                then '4 - L'
            when warehouse_size = 'X-Large'
                then '5 - XL'
            when warehouse_size = '2X-Large'
                then '6 - 2XL'
            when warehouse_size = '3X-Large'
                then '7 - 3XL'
            when warehouse_size = '4X-Large'
                then '8 - 4XL'
            when warehouse_size = '5X-Large'
                then '9 - 5XL'
            when warehouse_size = '6X-Large'
                then '10 - 6XL'
        end as warehouse_size_numeric,
        warehouse_type,

        query_text,
        query_type,
        dbt_run_reason,

        case
            when is_cold_storage_refresh
                then 'incremental - cold storage'
            -- This `when` clause can be removed on November 1, 2023 when `is_cold_storage_refresh` is populated into entire history of the dataset
            when dbt_cloud_job_id = '941'
                -- list of models in cold storage
                and dbt_model_name in (
                    'fct_dbt_invocations',
                    'stg_dbt_invocation_events',
                    'stg_dbt_run_model_events',
                    'current_snowplow_event',
                    'current_snowplow_dbt_docs',
                    'current_snowplow_context_splitter',
                    'stg_snowplow_events'
                )
                -- time period for cold storage before flag was added
                and start_time between '2022-12-04T2:00:00.000+00:00' and '2023-04-27T19:30:00.000+00:00'
                    then 'incremental - cold storage'
            else dbt_materialization_type
        end as dbt_materialization_type,

        rows_produced,
        credits_used_cloud_services,
        bytes_scanned / 1000000000 as gigabytes_scanned,
        percentage_scanned_from_cache,
        bytes_written / 1000000000 as gigabytes_written,
        bytes_spilled_to_local_storage / 1000000000 as gigabytes_spilled_to_local_storage,
        bytes_spilled_to_remote_storage / 1000000000 as gigabytes_spilled_to_remote_storage,

        is_cold_storage_refresh,

        case
            when is_cold_storage_refresh
                then false
            else is_incremental_full_refresh
        end as is_incremental_full_refresh,

        -- Query tags were introduced to our project January 11, 2023.
        -- This column and any downstream filtering using it can be removed on July 11, 2023
        case
            when start_time > '2023-01-11'
                then true
            else false
        end as has_expected_query_tags,

        start_time,
        end_time,
        execution_time / 1000 as execution_time_in_seconds,
        total_elapsed_time / 1000 as total_elapsed_time_in_seconds
    
    from parse_query_tags

)

select * from final
