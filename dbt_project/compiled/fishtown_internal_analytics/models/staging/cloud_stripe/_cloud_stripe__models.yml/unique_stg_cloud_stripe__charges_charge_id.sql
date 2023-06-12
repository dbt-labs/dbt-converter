
    
    

select
    charge_id as unique_field,
    count(*) as n_records

from analytics_dev.dbt_jstein.stg_cloud_stripe__charges
where charge_id is not null
group by charge_id
having count(*) > 1


