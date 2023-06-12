with source as (

    select * from raw.stitch_harvest.project_tasks

),

renamed as (

    select
    
        id as project_task_id,
        task_id,
        project_id,
        
        billable,
        created_at,
        hourly_rate,
        is_active,

        updated_at,
        _sdc_batched_at,
        _sdc_extracted_at,
        _sdc_received_at,
        _sdc_sequence,
        _sdc_table_version

    from source

)

select * from renamed