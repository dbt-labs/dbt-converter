
    
    

select
    project_id as unique_field,
    count(*) as n_records

from analytics_dev.dbt_jstein.stg_asana__projects
where project_id is not null
group by project_id
having count(*) > 1


