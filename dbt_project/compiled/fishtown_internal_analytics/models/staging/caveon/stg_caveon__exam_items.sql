with source as (

    select * from raw.caveon.exam_items

),

renamed as (

    select
        content_area,
        created_at,
        created_by_id,
        difficulty,
        exam_id,
        id as item_id,
        is_deleted,
        is_exposed,
        latest_item_type,
        live_version_id,
        live_version_number,
        name as item_name,
        num_versions

    from source

)

select * from renamed