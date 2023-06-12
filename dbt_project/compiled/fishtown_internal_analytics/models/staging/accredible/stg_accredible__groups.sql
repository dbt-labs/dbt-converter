with

source as (

    select * from raw.accredible.groups

),

renamed as (

    select
        -- ids
        id as group_id,
        department_id,
        primary_design_id,
        design_id,
        badge_design_id,
        certificate_design_id,

        -- dimensions
        name as group_name,
        course_name,
        design_name,
        course_description,
        language,
        course_link as course_url,

        -- booleans
        attach_pdf as has_pdf_attached,
        blockchain as is_on_blockchain,
        
        -- variants/arrays
        to_array(learning_outcomes) as learning_outcomes_array,
        
        -- datetime
        created_at,
        updated_at,
        _sdc_batched_at,
        _sdc_received_at,
        _sdc_sequence,
        _sdc_table_version

    from source

)

select * from renamed