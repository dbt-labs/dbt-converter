





with validation_errors as (

    select
        worker_id, assignment_valid_from
    from analytics_dev.dbt_jstein.stg_adp__work_assignment_history
    group by worker_id, assignment_valid_from
    having count(*) > 1

)

select *
from validation_errors


