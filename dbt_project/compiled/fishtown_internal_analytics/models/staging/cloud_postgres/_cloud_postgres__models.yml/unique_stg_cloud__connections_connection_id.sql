
    
    

select
    connection_id as unique_field,
    count(*) as n_records

from analytics_dev.dbt_jstein.stg_cloud__connections
where connection_id is not null
group by connection_id
having count(*) > 1


