
    
    

select
    worker_assignment_id as unique_field,
    count(*) as n_records

from analytics_dev.dbt_jstein.stg_adp__worker_assigned_locations
where worker_assignment_id is not null
group by worker_assignment_id
having count(*) > 1


