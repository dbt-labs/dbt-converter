
    
    

select
    response_answer_id as unique_field,
    count(*) as n_records

from ANALYTICS.dbt_jstein.base__delighted_response_answers
where response_answer_id is not null
group by response_answer_id
having count(*) > 1


