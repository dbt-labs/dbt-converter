
    
    

select
    trigger_id as unique_field,
    count(*) as n_records

from analytics_dev.dbt_jstein.stg_cloud__run_triggers
where trigger_id is not null
group by trigger_id
having count(*) > 1


