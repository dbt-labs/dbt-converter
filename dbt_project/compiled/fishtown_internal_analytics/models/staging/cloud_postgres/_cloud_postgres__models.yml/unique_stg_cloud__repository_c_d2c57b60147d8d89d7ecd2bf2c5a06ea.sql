
    
    

select
    repository_credentials_id as unique_field,
    count(*) as n_records

from analytics_dev.dbt_jstein.stg_cloud__repository_credentials
where repository_credentials_id is not null
group by repository_credentials_id
having count(*) > 1


