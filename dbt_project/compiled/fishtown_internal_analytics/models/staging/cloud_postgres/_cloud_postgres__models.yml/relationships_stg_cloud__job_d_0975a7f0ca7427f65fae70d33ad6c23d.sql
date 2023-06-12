
    
    

with child as (
    select environment_id as from_field
    from analytics_dev.dbt_jstein.stg_cloud__job_definitions
    where environment_id is not null
),

parent as (
    select environment_id as to_field
    from analytics_dev.dbt_jstein.stg_cloud__environments
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


