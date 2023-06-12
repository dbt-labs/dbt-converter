
    
    

select
    task_id as unique_field,
    count(*) as n_records

from analytics_dev.dbt_jstein.stg_asana__tasks
where task_id is not null
group by task_id
having count(*) > 1


