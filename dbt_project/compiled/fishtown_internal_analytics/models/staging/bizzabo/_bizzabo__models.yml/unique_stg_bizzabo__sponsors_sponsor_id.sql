
    
    

select
    sponsor_id as unique_field,
    count(*) as n_records

from analytics_dev.dbt_jstein.stg_bizzabo__sponsors
where sponsor_id is not null
group by sponsor_id
having count(*) > 1


