with 

source as (

    select * from {{ source( 'intercom', 'admins')}}

),

renamed as (

    select
    
        --ids
        id as admin_id,
        team_ids,
        
        --dimensions
        email, 
        name as assignee_name, 
        type, 
        
        --boolean
        away_mode_enabled as is_away_mode_enable,
        away_mode_reassign as is_away_mode_reassign, 
        has_inbox_seat
        
    from source
    where type = 'admin'
)

select * from renamed