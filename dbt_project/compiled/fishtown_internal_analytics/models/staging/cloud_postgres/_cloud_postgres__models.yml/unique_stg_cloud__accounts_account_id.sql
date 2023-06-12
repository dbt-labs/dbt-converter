
    
    

select
    account_id as unique_field,
    count(*) as n_records

from analytics_dev.dbt_jstein.stg_cloud__accounts
where account_id is not null
group by account_id
having count(*) > 1


