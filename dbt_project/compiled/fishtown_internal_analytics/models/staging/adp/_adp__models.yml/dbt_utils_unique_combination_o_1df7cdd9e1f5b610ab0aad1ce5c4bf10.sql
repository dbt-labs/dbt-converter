





with validation_errors as (

    select
        organizational_unit_id, worker_assignment_id, worker_id
    from analytics_dev.dbt_jstein.stg_adp__worker_assigned_organizational_units
    group by organizational_unit_id, worker_assignment_id, worker_id
    having count(*) > 1

)

select *
from validation_errors


