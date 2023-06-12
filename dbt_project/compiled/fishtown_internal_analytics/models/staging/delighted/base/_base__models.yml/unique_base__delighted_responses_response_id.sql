
    
    

select
    response_id as unique_field,
    count(*) as n_records

from analytics_dev.dbt_jstein.base__delighted_responses
where response_id is not null
group by response_id
having count(*) > 1


