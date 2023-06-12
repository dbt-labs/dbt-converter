
    
    

select
    credential_id as unique_field,
    count(*) as n_records

from ANALYTICS.dbt_jstein.stg_accredible__credentials
where credential_id is not null
group by credential_id
having count(*) > 1


