
    
    

select
    response_answer_id as unique_field,
    count(*) as n_records

from analytics_dev.dbt_jstein.stg_delighted__response_answers
where response_answer_id is not null
group by response_answer_id
having count(*) > 1


