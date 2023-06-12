
    
    

select
    speaker_id as unique_field,
    count(*) as n_records

from analytics_dev.dbt_jstein.stg_bizzabo__speakers
where speaker_id is not null
group by speaker_id
having count(*) > 1


