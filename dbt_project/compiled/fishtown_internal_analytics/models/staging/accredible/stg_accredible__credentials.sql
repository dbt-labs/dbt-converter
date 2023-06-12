with

source as (

    select * from raw.accredible.credentials

),

renamed as (

    select
        -- ids
        id as credential_id,
        recipient:id::varchar as recipient_id,
        group_id,
        encoded_id,
    
        -- dimensions
        lower(recipient:email::varchar) as recipient_email,
        recipient:name::varchar as recipient_name,
        name as credential_name,
        group_name as credential_group_name,
        description as credential_description,
        issuer as credential_issuer,
        course_link as course_url,
        url as credential_url,
        seo_image as seo_image_url,

        case
            when credential_name = 'dbt Developer'
                then row_number() over (
                    partition by recipient_email, credential_name
                    order by issued_on
                )
            else null 
        end as developer_credential_number,

        case
            when credential_name = 'dbt Developer'
                then md5(cast(coalesce(cast(recipient_email as TEXT), '') || '-' || coalesce(cast(developer_credential_number as TEXT), '') as TEXT))
            else 'not_a_developer_credential' 
        end as credential_exam_id,


        -- booleans
        coalesce(
            expired_on::date > current_date(),
            false
        ) as is_active_certification,
        approve as is_approved,
        complete as is_complete,
        private as is_private,
        
        -- variants/arrays
        badge as badge_json,
        certificate as certificate_json,
        recipient as recipient_json,
        try_parse_json(custom_attributes) as custom_attributes_array,
        to_array(evidence_items) as evidence_items_array,
        to_array(references) as references_array,

        -- datetimes
        issued_on::date as credential_issued_date,
        expired_on::date as credential_expired_date,
        _sdc_batched_at,
        _sdc_received_at,
        _sdc_sequence,
        _sdc_table_version

    from source

    where credential_group_name != '123456'

)

select * from renamed