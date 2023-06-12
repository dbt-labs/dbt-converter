
    
    

select
    exam_id as unique_field,
    count(*) as n_records

from analytics_dev.dbt_jstein.stg_caveon__exams
where exam_id is not null
group by exam_id
having count(*) > 1


