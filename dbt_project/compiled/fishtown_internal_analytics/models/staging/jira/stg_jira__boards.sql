

with

source as (

    select * from raw.fivetran_jira.board

),

renamed as (
    
    select 
        id as board_id,
        name as board_name,
        type as board_type
        
    from source
    where not _fivetran_deleted

)

select * from renamed