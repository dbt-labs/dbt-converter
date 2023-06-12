with

production_queries as (

    select * from {{ ref('stg_snowflake__production_queries') }}
    -- This filter can be removed on July 11, 2023
    where has_expected_query_tags = true

),

model_performance_by_run as (

    select
        dbt_cloud_run_id,
        dbt_model_name,
        dbt_materialization_type,
        is_incremental_full_refresh,
        warehouse_size_numeric,

        sum(credits_used_cloud_services) as total_cloud_credits_used,
        sum(total_elapsed_time_in_seconds) as total_execution_time_in_seconds,
        sum(rows_produced) as total_rows_produced,
        sum(gigabytes_written) as total_gigabytes_written,
        sum(gigabytes_spilled_to_local_storage) as total_gigabytes_spilled_to_local_storage,
        sum(gigabytes_spilled_to_remote_storage) as total_gigabytes_spilled_to_remote_storage,

        min(start_time) as run_started_at

    from production_queries
    {{ dbt_utils.group_by(n = 5) }}

),

filtered as (
    -- the below CTE gets the most recent 100 runs per unique config
    select * from model_performance_by_run
    qualify row_number() over (
            partition by 
                dbt_model_name,
                dbt_materialization_type,
                is_incremental_full_refresh,
                warehouse_size_numeric
            order by
                run_started_at desc
        ) <= 100

),

average_model_performance as (

    select
        dbt_model_name,
        dbt_materialization_type,
        is_incremental_full_refresh,
        warehouse_size_numeric,

        count(*) as count_of_runs,
        avg(total_cloud_credits_used) as average_cloud_credits_used,
        avg(total_execution_time_in_seconds) as average_execution_time_in_seconds,
        avg(total_rows_produced) as average_rows_produced,
        avg(total_gigabytes_written) as average_gigabytes_written,
        avg(total_gigabytes_spilled_to_local_storage) as average_gigabytes_spilled_to_local_storage,
        avg(total_gigabytes_spilled_to_remote_storage) as average_gigabytes_spilled_to_remote_storage

    from filtered
    {{ dbt_utils.group_by(n = 4) }}

),

final as (

    select
        *,

        average_execution_time_in_seconds * 
        (
            case
                when warehouse_size_numeric = '1 - XS'
                    then 0.0003
                when warehouse_size_numeric = '2 - S'
                    then 0.0006
                when warehouse_size_numeric = '3 - M'
                    then 0.0011
                when warehouse_size_numeric = '4 - L'
                    then 0.0022
                when warehouse_size_numeric = '5 - XL'
                    then 0.0044
                when warehouse_size_numeric = '6 - 2XL'
                    then 0.0089
                when warehouse_size_numeric = '7 - 3XL'
                    then 0.0178
                when warehouse_size_numeric = '8 - 4XL'
                    then 0.0356
                when warehouse_size_numeric = '9 - 5XL'
                    then 0.0711
                when warehouse_size_numeric = '10 - 6XL'
                    then 0.1422
            end
        ) as average_compute_credits_used

    from average_model_performance
    
)

select * from final