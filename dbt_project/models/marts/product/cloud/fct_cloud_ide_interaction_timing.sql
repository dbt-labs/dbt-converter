{{
  config(
    materialized = "view"
  )
}}

with

git_operations as (

    select * from {{ ref('stg_dbt_cloud__ide_git_operation') }}

),

git_operation_completion as (

    select * from {{ ref('stg_dbt_cloud__ide_git_operation_complete') }}

),

final as (

    select
        git_operations.ide_git_operation_id as interaction_id,
        git_operations.page_view_id,
        git_operations.database_source,
        git_operations.app_id,
        case
            when git_operations.app_id = 'dbt cloud' then '1.0'
            else '1.1'
        end as ide_version,
        'git_operations' as interaction_category,
        git_operations.git_operation_type as interaction_type,
        git_operations.current_status as interaction_detals,
        git_operations.event_at,
        git_operation_completion.timing_in_ms,
        git_operation_completion.completion_status as interaction_status,
        git_operation_completion.error_logs

    from git_operations
    left join git_operation_completion
        on git_operations.ide_git_operation_id = git_operation_completion.ide_git_operation_id

)

select * from final