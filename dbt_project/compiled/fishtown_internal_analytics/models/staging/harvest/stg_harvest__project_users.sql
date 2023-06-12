with source as (

    select * from raw.stitch_harvest.project_users

),

renamed as (

    select
    
        id as project_user_id,
        project_id,
        user_id,
        budget,
        hourly_rate,
        is_active,
        is_project_manager,

        updated_at,
        created_at,
        _sdc_batched_at,
        _sdc_extracted_at,
        _sdc_received_at,
        _sdc_sequence,
        _sdc_table_version

    from source

)

select * from renamed