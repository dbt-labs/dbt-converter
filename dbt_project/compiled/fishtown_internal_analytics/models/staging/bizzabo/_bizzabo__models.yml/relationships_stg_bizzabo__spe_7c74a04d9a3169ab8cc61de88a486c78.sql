
    
    

with child as (
    select event_id as from_field
    from analytics_dev.dbt_jstein.stg_bizzabo__speakers
    where event_id is not null
),

parent as (
    select event_id as to_field
    from analytics_dev.dbt_jstein.stg_bizzabo__events
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


