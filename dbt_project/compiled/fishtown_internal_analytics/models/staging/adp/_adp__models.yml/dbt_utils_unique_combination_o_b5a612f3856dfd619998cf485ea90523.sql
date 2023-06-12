





with validation_errors as (

    select
        worker_id, is_first_assignment
    from (select * from analytics_dev.dbt_jstein.stg_adp__work_assignment_history where is_first_assignment = true) dbt_subquery
    group by worker_id, is_first_assignment
    having count(*) > 1

)

select *
from validation_errors


