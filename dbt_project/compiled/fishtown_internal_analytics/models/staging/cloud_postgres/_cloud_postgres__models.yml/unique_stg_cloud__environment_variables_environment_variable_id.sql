
    
    

select
    environment_variable_id as unique_field,
    count(*) as n_records

from analytics_dev.dbt_jstein.stg_cloud__environment_variables
where environment_variable_id is not null
group by environment_variable_id
having count(*) > 1


