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
        trim(name) as course_name,
        description as course_description,
        slug as course_slug,
        keywords as course_keywords,
        reviews_enabled as has_reviews_enabled

    from source

)


select * from renamed