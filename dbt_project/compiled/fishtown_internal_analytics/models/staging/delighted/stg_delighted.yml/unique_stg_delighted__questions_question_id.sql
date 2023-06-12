
    
    

select
    question_id as unique_field,
    count(*) as n_records

from analytics_dev.dbt_jstein.stg_delighted__questions
where question_id is not null
group by question_id
having count(*) > 1


