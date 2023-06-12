
    
    

select
    session_checkin_id as unique_field,
    count(*) as n_records

from analytics_dev.dbt_jstein.stg_bizzabo__session_checkins
where session_checkin_id is not null
group by session_checkin_id
having count(*) > 1


