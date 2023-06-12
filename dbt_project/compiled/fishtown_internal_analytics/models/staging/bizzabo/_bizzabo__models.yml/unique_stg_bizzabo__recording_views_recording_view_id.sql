
    
    

select
    recording_view_id as unique_field,
    count(*) as n_records

from analytics_dev.dbt_jstein.stg_bizzabo__recording_views
where recording_view_id is not null
group by recording_view_id
having count(*) > 1


