with

source as (

    select * from raw.fivetran_jira.priority

),

final as (
    
    select 
        id as priority_id,
        name as priority_name,
        description as priority_description
        
    from source

)

select * from final