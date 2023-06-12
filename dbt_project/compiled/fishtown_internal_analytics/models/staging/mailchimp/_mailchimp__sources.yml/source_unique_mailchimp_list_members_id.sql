
    
    

select
    id as unique_field,
    count(*) as n_records

from raw.mailchimp_data.list_members
where id is not null
group by id
having count(*) > 1


