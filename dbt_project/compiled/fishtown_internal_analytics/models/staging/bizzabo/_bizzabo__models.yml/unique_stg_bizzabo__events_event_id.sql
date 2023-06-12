
    
    

select
    event_id as unique_field,
    count(*) as n_records

from analytics_dev.dbt_jstein.stg_bizzabo__events
where event_id is not null
group by event_id
having count(*) > 1


