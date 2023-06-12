
    
    

select
    delivery_item_response_id as unique_field,
    count(*) as n_records

from analytics_dev.dbt_jstein.stg_caveon__exam_delivery_item_responses
where delivery_item_response_id is not null
group by delivery_item_response_id
having count(*) > 1


