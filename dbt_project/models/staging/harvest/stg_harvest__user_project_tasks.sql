with source as (

    select * from {{ source('harvest', 'user_project_tasks') }}

),

renamed as (

    select
    
        project_task_id,
        user_id,
        {{ dbt_utils.generate_surrogate_key([
            'project_task_id',
            'user_id',
        ])}} as user_project_task_id,
        
        _sdc_batched_at,
        _sdc_extracted_at,
        _sdc_received_at,
        _sdc_sequence,
        _sdc_table_version

    from source

)

select * from renamed