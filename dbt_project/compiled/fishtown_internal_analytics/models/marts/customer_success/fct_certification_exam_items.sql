with exams as (

    select * from analytics_dev.dbt_jstein.stg_caveon__exams

),

exam_deliveries as (

    select * from analytics_dev.dbt_jstein.stg_caveon__exam_deliveries

),

exam_delivery_item_responses as (

    select * from analytics_dev.dbt_jstein.stg_caveon__exam_delivery_item_responses
    
),

exam_items as (

    select * from analytics_dev.dbt_jstein.stg_caveon__exam_items

),

users as (

    select * from analytics_dev.dbt_jstein.stg_caveon__users

),

final as (

    select
        exams.exam_name,
        exam_items.item_name,
        exam_items.content_area,
        exam_delivery_item_responses.item_version_name,
        exam_delivery_item_responses.item_type,
        users.full_name as item_created_by,
        exam_delivery_item_responses.points,
        exam_delivery_item_responses.score,
        exam_delivery_item_responses.is_item_unscored,
        exam_deliveries.completed_at

    from exam_delivery_item_responses
    left join exam_deliveries
        on exam_delivery_item_responses.delivery_id = exam_deliveries.delivery_id
    left join exam_items
        on exam_delivery_item_responses.item_id = exam_items.item_id
    left join exams
        on exam_items.exam_id = exams.exam_id
    left join users
        on exam_items.created_by_id = users.user_id

)

select * from final