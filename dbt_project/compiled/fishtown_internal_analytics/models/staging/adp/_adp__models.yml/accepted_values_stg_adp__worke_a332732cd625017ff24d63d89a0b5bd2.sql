
    
    

with all_values as (

    select
        worker_status as value_field,
        count(*) as n_records

    from analytics_dev.dbt_jstein.stg_adp__workers
    group by worker_status

)

select *
from all_values
where value_field not in (
    'Active','Terminated'
)


