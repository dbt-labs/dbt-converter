with 

source as (

    select * from raw.thinkific.groups

),

renamed as (

    select

        -- keys
        id as group_id,
        token as unique_identifier,

        -- description
        name as group_name,
        
        -- timestamps
        created_at::timestamp_ntz as created_at

        -- meta
        -- _sdc_batched_at,
        -- _sdc_received_at,
        -- _sdc_sequence,
        -- _sdc_table_version   

    from source

)

select * from renamed