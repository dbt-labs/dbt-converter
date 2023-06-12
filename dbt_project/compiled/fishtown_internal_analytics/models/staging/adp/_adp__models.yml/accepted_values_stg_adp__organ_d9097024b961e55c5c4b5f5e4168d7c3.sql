
    
    

with all_values as (

    select
        organizational_level_name as value_field,
        count(*) as n_records

    from analytics_dev.dbt_jstein.stg_adp__organizational_units
    group by organizational_level_name

)

select *
from all_values
where value_field not in (
    'Department','Business Unit'
)


