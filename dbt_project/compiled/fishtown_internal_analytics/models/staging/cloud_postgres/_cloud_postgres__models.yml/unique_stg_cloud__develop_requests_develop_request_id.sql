
    
    

select
    develop_request_id as unique_field,
    count(*) as n_records

from analytics_dev.dbt_jstein.stg_cloud__develop_requests
where develop_request_id is not null
group by develop_request_id
having count(*) > 1


