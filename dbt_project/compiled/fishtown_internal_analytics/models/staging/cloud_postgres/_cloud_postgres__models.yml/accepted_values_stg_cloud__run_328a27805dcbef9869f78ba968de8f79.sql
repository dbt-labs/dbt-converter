
    
    

with all_values as (

    select
        trigger_type as value_field,
        count(*) as n_records

    from analytics_dev.dbt_jstein.stg_cloud__run_triggers
    group by trigger_type

)

select *
from all_values
where value_field not in (
    'pull request','scheduled','api','manual'
)


