with source as (

    select * from raw.stitch_harvest.user_project_tasks

),

renamed as (

    select
    
        project_task_id,
        user_id,
        md5(cast(coalesce(cast(project_task_id as TEXT), '') || '-' || coalesce(cast(user_id as TEXT), '') as TEXT)) as user_project_task_id,
        
        _sdc_batched_at,
        _sdc_extracted_at,
        _sdc_received_at,
        _sdc_sequence,
        _sdc_table_version

    from source

)

select * from renamed