
    
    

select
    group_id as unique_field,
    count(*) as n_records

from ANALYTICS.dbt_jstein.stg_accredible__groups
where group_id is not null
group by group_id
having count(*) > 1


