
    
    

with child as (
    select repository_id as from_field
    from analytics_dev.dbt_jstein.stg_cloud__projects
    where repository_id is not null
),

parent as (
    select repository_id as to_field
    from analytics_dev.dbt_jstein.stg_cloud__repos
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


