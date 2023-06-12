with

users as (
    
    select * from {{ source("greenhouse", "user") }}
    where disabled = false
    
),

final as (
        
    select 
        users.id as greenhouse_user_id,
        users.first_name || ' ' || users.last_name as greenhouse_user_name,
        users.first_name,
        users.last_name,
        users.employee_id,
        users.created_at as user_created_at,
        users.updated_at as user_updated_at

    from users

)


select * from final