
    
    

select
    project_task_id as unique_field,
    count(*) as n_records

from analytics_dev.dbt_jstein.stg_asana__project_tasks
where project_task_id is not null
group by project_task_id
having count(*) > 1


