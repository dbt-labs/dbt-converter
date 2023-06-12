with 

source as (

    select * from raw.thinkific.users

),

renamed as (

    select
    
        -- keys
        id as user_id,
        administered_course_ids,

        -- descriptions
        full_name as user_name,
        case 
            when company=NULL then NULL
            when company='' then NULL
            else company
        end as user_company,
        email as user_email,
        roles as user_role,

        -- times
        created_at::timestamp_ntz as created_at

        -- meta
        -- _sdc_batched_at,
        -- _sdc_received_at,
        -- _sdc_sequence,
        -- _sdc_table_version

        -- ignored
        -- affiliate_commission_type,
        -- first_name,
        -- last_name,
        -- custom_profile_fields,
        -- headline,
        -- external_source,
        -- avatar_url,

    from source

)

select * from renamed