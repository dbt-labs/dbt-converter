
    
    

select
    issue_id as unique_field,
    count(*) as n_records

from analytics_dev.dbt_jstein.stg_github__pull_requests
where issue_id is not null
group by issue_id
having count(*) > 1


