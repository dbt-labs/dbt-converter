with 

source as (

    select * from raw.thinkific.courses

),

renamed as (

    select

        -- keys
        id as course_id,
        instructor_id,
        product_id,
        user_id,

        -- description
        name as course_name,
        description as course_description,
        slug as course_slug,
        keywords as course_keywords,
        reviews_enabled as has_reviews_enabled

        -- meta
        -- _sdc_batched_at,
        -- _sdc_received_at,
        -- _sdc_sequence,
        -- _sdc_table_version

        -- ignored
        -- administrator_user_ids,
        -- chapter_ids,
        -- banner_image_url,
        -- course_card_image_url,

    from source

)


select * from renamed