
    
    

select
    id as unique_field,
    count(*) as n_records

from raw.fivetran_hubspot.marketing_email
where id is not null
group by id
having count(*) > 1


