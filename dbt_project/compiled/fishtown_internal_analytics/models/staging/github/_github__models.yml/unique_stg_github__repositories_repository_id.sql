
    
    

select
    repository_id as unique_field,
    count(*) as n_records

from analytics_dev.dbt_jstein.stg_github__repositories
where repository_id is not null
group by repository_id
having count(*) > 1


