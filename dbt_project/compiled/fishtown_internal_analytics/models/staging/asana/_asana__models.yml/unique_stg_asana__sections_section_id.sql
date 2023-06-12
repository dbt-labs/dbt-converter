
    
    

select
    section_id as unique_field,
    count(*) as n_records

from analytics_dev.dbt_jstein.stg_asana__sections
where section_id is not null
group by section_id
having count(*) > 1


