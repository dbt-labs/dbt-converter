
    
    

with child as (
    select job_definition_id as from_field
    from analytics_dev.dbt_jstein.stg_cloud__runs
    where job_definition_id is not null
),

parent as (
    select job_definition_id as to_field
    from analytics_dev.dbt_jstein.stg_cloud__job_definitions
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


