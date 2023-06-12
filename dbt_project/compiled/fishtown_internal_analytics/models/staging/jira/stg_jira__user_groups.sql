with

source as (

    select * from raw.fivetran_jira.user_group

),

final as (
    
    select 
        user_id,
        group_name
        
    from source

)

select * from final