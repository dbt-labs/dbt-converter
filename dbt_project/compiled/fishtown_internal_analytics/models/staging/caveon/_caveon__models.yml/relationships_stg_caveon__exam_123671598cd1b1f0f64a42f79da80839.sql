
    
    

with child as (
    select item_id as from_field
    from analytics_dev.dbt_jstein.stg_caveon__exam_delivery_item_responses
    where item_id is not null
),

parent as (
    select item_id as to_field
    from analytics_dev.dbt_jstein.stg_caveon__exam_items
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


