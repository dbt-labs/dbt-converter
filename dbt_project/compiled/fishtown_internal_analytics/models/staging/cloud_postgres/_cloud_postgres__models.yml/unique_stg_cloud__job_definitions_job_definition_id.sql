
    
    

select
    job_definition_id as unique_field,
    count(*) as n_records

from analytics_dev.dbt_jstein.stg_cloud__job_definitions
where job_definition_id is not null
group by job_definition_id
having count(*) > 1


