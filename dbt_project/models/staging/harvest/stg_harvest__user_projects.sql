with source as (

    select * from {{ source('harvest', 'user_projects') }}

),

renamed as (

    select
    
        id as user_project_id,
        client_id,
        project_id,
        user_id,

        budget,
        hourly_rate,
        is_active,
        is_project_manager,

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