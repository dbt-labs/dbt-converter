
    
    

select
    task_event_id as unique_field,
    count(*) as n_records

from analytics_dev.dbt_jstein.stg_asana__task_events
where task_event_id is not null
group by task_event_id
having count(*) > 1


