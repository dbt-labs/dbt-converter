
    
    

select
    pull_request_id as unique_field,
    count(*) as n_records

from analytics_dev.dbt_jstein.stg_github__pull_requests
where pull_request_id is not null
group by pull_request_id
having count(*) > 1


