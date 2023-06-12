
    
    

with all_values as (

    select
        exam_id as value_field,
        count(*) as n_records

    from analytics_dev.dbt_jstein.stg_caveon__exams
    group by exam_id

)

select *
from all_values
where value_field not in (
    'be4fe3bb-c4cf-45ee-94f7-34191acbcfc1'
)


