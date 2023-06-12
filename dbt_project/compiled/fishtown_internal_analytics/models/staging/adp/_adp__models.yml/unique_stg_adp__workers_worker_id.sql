
    
    

select
    worker_id as unique_field,
    count(*) as n_records

from analytics_dev.dbt_jstein.stg_adp__workers
where worker_id is not null
group by worker_id
having count(*) > 1


