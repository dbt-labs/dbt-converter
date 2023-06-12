
    
    

select
    delivery_id as unique_field,
    count(*) as n_records

from analytics_dev.dbt_jstein.stg_caveon__exam_deliveries
where delivery_id is not null
group by delivery_id
having count(*) > 1


