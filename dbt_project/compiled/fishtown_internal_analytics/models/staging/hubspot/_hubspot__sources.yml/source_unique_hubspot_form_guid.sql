
    
    

select
    guid as unique_field,
    count(*) as n_records

from raw.fivetran_hubspot.form
where guid is not null
group by guid
having count(*) > 1


