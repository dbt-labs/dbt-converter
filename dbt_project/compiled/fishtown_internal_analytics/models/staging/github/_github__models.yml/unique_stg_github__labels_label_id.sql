
    
    

select
    label_id as unique_field,
    count(*) as n_records

from analytics_dev.dbt_jstein.stg_github__labels
where label_id is not null
group by label_id
having count(*) > 1


