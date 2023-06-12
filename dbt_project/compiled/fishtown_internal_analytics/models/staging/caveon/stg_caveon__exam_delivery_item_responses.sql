with source as (

    select * from raw.caveon.exam_delivery_item_responses

),

renamed as (

    select
        delivery_id as delivery_id,
        id as delivery_item_response_id,
        is_excluded,
        item_id,
        item_type,
        item_version_id,
        item_version_name,
        points,
        score,
        case
            when score = 0
                then true
            else false
        end as is_item_unscored

    from source

)

select * from renamed