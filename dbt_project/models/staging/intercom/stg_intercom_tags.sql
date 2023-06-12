with 

source as (
    
    select * from {{ source( 'intercom', 'tags')}}

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

