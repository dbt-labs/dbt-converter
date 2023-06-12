
    
    

select
    environment_id as unique_field,
    count(*) as n_records

from analytics_dev.dbt_jstein.stg_cloud__environments
where environment_id is not null
group by environment_id
having count(*) > 1


