
    
    

select
    unique_id as unique_field,
    count(*) as n_records

from analytics_dev.dbt_jstein.stg_cloud_stripe__invoice_line_items
where unique_id is not null
group by unique_id
having count(*) > 1


