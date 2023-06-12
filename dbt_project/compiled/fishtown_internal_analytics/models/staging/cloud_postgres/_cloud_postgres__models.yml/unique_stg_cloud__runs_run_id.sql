
    
    

select
    run_id as unique_field,
    count(*) as n_records

from analytics_dev.dbt_jstein.stg_cloud__runs
where run_id is not null
group by run_id
having count(*) > 1


