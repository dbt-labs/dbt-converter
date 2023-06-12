with source as (

    select * from {{ source('harvest', 'roles') }}

),

renamed as (

    select
    
        id as role_id,
        name as role_name,
        
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