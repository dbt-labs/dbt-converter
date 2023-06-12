
    
    

select
    worker_id as unique_field,
    count(*) as n_records

from ANALYTICS.dbt_jstein.stg_adp__business_communications
where worker_id is not null
group by worker_id
having count(*) > 1


