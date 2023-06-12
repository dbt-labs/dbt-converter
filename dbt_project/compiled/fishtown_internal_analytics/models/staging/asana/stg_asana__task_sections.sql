with

task_sections as (

    select * from analytics_dev.dbt_jstein.base__asana_task_sections

),

sections as (

    select * from analytics_dev.dbt_jstein.stg_asana__sections

),

joined as (

    select
        
    
md5(cast(coalesce(cast(project_id as TEXT), '') || '-' || coalesce(cast(task_id as TEXT), '') as TEXT)) as project_task_id,

       task_sections.*,

       sections.project_id,
       sections.section_name as current_section_name

    from task_sections
    left join sections
        on task_sections.section_id = sections.section_id

)

select * from joined