
    
    

select
    subscription_id as unique_field,
    count(*) as n_records

from analytics_dev.dbt_jstein.stg_cloud_stripe__subscriptions
where subscription_id is not null
group by subscription_id
having count(*) > 1


