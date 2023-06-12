
    
    

select
    id as unique_field,
    count(*) as n_records

from raw.fivetran_hubspot.calendar_event
where id is not null
group by id
having count(*) > 1


