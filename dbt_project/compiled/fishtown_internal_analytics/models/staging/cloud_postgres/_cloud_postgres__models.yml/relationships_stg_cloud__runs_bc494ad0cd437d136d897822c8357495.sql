
    
    

with child as (
    select trigger_id as from_field
    from analytics_dev.dbt_jstein.stg_cloud__runs
    where trigger_id is not null
),

parent as (
    select trigger_id as to_field
    from analytics_dev.dbt_jstein.stg_cloud__run_triggers
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


