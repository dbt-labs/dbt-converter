
    
    

with child as (
    select exam_id as from_field
    from analytics_dev.dbt_jstein.stg_caveon__exam_items
    where exam_id is not null
),

parent as (
    select exam_id as to_field
    from analytics_dev.dbt_jstein.stg_caveon__exams
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


