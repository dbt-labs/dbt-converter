
    
    

select
    issue_id as unique_field,
    count(*) as n_records

from analytics_dev.dbt_jstein.stg_github__issues_merged
where issue_id is not null
group by issue_id
having count(*) > 1


