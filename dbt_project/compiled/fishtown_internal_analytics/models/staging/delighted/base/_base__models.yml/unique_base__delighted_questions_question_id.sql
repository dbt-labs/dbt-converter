
    
    

select
    question_id as unique_field,
    count(*) as n_records

from ANALYTICS.dbt_jstein.base__delighted_questions
where question_id is not null
group by question_id
having count(*) > 1


