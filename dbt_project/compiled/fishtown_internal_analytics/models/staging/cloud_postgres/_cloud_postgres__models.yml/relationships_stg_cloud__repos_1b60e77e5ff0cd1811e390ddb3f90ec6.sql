
    
    

with child as (
    select project_id as from_field
    from analytics_dev.dbt_jstein.stg_cloud__repos
    where project_id is not null
),

parent as (
    select project_id as to_field
    from analytics_dev.dbt_jstein.stg_cloud__projects
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


