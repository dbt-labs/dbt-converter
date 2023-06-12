
    
    

select
    id as unique_field,
    count(*) as n_records

from raw.mailchimp_data.campaigns
where id is not null
group by id
having count(*) > 1


