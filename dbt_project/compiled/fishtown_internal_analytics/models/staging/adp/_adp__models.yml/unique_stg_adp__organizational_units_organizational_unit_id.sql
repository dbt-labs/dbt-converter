
    
    

select
    organizational_unit_id as unique_field,
    count(*) as n_records

from analytics_dev.dbt_jstein.stg_adp__organizational_units
where organizational_unit_id is not null
group by organizational_unit_id
having count(*) > 1


