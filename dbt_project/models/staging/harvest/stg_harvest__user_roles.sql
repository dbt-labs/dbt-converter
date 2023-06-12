with source as (

    select * from {{ source('harvest', 'user_roles') }}

),

renamed as (

    select
    
        role_id,
        user_id,
        {{ dbt_utils.generate_surrogate_key([
            'role_id',
            'user_id',
        ])}} as user_role_id,
        
        _sdc_batched_at,
        _sdc_extracted_at,
        _sdc_received_at,
        _sdc_sequence,
        _sdc_table_version

    from source

)

select * from renamed