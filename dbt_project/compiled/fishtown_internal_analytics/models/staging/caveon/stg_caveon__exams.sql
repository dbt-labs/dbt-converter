with source as (

    select * from raw.caveon.exams

),

renamed as (

    select
        id as exam_id,
        name as exam_name,
        organization_id,
        slug

    from source

)

select * from renamed