
    
    

select
    ticket_id as unique_field,
    count(*) as n_records

from analytics_dev.dbt_jstein.stg_bizzabo__tickets
where ticket_id is not null
group by ticket_id
having count(*) > 1


