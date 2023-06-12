
    
    

select
    account_adapter_id as unique_field,
    count(*) as n_records

from analytics_dev.dbt_jstein.stg_cloud__dbt_adapters
where account_adapter_id is not null
group by account_adapter_id
having count(*) > 1


