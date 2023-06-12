
    
    

with all_values as (

    select
        type as value_field,
        count(*) as n_records

    from analytics_dev.dbt_jstein.stg_cloud__connections
    group by type

)

select *
from all_values
where value_field not in (
    'redshift','bigquery','snowflake','postgres','adapter'
)


