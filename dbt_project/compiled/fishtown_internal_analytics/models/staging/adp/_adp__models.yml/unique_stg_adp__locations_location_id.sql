
    
    

select
    location_id as unique_field,
    count(*) as n_records

from analytics_dev.dbt_jstein.stg_adp__locations
where location_id is not null
group by location_id
having count(*) > 1


