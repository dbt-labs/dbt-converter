with migration_tasks as (

    select
        * 
    from {{ ref('fct_asana_project_tasks') }}
    where project_id = '1203671999710652'

),

trim_columns as (

    select 
        salesforce_account_id,
        st_migration_cutover_at::date as st_migration_cutover_at,
        current_section_name as migration_stage
    from migration_tasks

),

add_flag as (

    select 
        *,
        case 
            when migration_stage = 'Migration Complete'
                then true
                else false
        end as has_completed_st_migration 
    from trim_columns
    
)

select * from add_flag 