

with users as (
    select * from analytics_dev.dbt_jstein.stg__salesforce_users
),

managers as (
    select
        distinct users.manager_id,
        users_managers.name as manager_name,
        users_managers.user_role as manager_role,
        true as is_manager
    from users
    left join users users_managers
        on users.manager_id = users_managers.user_id 
    where users.manager_id is not null
),



is_manager_join as (
    select
        users.*,
        managers.manager_name,
        managers.manager_role,
        coalesce(user_is_manager.is_manager, false) as is_manager
    from users
    left join managers
        on users.manager_id = managers.manager_id 
    left join managers user_is_manager
        on users.user_id = user_is_manager.manager_id

),

final as (
    select
        user_id,
        name, 
        user_role,
        username,
        alias,
        email,
        manager_id,
        manager_name,
        manager_role,
        is_manager,
        is_active,
        created_at
    from is_manager_join
)

select * from is_manager_join