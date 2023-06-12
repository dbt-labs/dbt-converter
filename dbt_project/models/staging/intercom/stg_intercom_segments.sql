with 

source as (
    
    select * from {{ source( 'intercom', 'segments')}}

),

renamed as (
    
    select
        --ids
        id as segment_id,
        
        --dimensions
        name,
        type,
        
        --dates
        created_at,
        updated_at
    from source
    
)

select * from renamed