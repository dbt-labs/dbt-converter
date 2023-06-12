
    
    

select
    pull_request_review_id as unique_field,
    count(*) as n_records

from analytics_dev.dbt_jstein.stg_github__pull_request_reviews
where pull_request_review_id is not null
group by pull_request_review_id
having count(*) > 1


