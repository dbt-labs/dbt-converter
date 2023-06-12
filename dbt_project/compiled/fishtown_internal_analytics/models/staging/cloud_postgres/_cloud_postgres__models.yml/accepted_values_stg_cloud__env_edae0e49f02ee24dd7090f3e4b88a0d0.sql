
    
    

with all_values as (

    select
        environment_type as value_field,
        count(*) as n_records

    from analytics_dev.dbt_jstein.stg_cloud__environments
    group by environment_type

)

select *
from all_values
where value_field not in (
    'development','deployment'
)


