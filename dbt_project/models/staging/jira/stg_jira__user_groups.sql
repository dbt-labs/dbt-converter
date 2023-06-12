with

source as (

    select * from {{ source('jira', 'user_group') }}

),

final as (
    
    select 
        user_id,
        group_name
        
    from source

)

select * from final