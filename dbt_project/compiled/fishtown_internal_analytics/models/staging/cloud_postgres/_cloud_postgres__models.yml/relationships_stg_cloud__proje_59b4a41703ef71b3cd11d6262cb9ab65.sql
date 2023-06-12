
    
    

with child as (
    select connection_id as from_field
    from analytics_dev.dbt_jstein.stg_cloud__projects
    where connection_id is not null
),

parent as (
    select connection_id as to_field
    from analytics_dev.dbt_jstein.stg_cloud__connections
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


