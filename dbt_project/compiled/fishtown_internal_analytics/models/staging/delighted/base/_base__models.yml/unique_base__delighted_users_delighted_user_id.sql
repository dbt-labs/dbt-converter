
    
    

select
    delighted_user_id as unique_field,
    count(*) as n_records

from analytics_dev.dbt_jstein.base__delighted_users
where delighted_user_id is not null
group by delighted_user_id
having count(*) > 1


