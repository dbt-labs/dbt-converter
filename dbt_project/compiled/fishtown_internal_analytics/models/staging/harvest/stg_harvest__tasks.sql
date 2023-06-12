with source as (

    select * from raw.stitch_harvest.tasks

),

renamed as (

    select
    
        id as task_id,
        name as task_name,
        
        billable_by_default,
        is_active,
        is_default,
        
        created_at,
        updated_at,
        _sdc_batched_at,
        _sdc_extracted_at,
        _sdc_received_at,
        _sdc_sequence,
        _sdc_table_version

    from source

)

select * from renamed