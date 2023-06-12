with 

source as (
    
    select * from raw.intercom_stitch.tags

),

renamed as (
    
    select
        --ids
        id as tag_id,
        
        name,
        type
        
    from source
    
)

select * from renamed