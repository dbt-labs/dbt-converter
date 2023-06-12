with users as (

    select * from {{ ref('fct_cloud_users') }}
    
),

nps_feedback as (

    select
        dbt_cloud_user_id as user_id,
        MAX(created_at) as last_nps_at
    from {{ ref('fct_customer_nps') }}
    where feedback_source = 'dbt_cloud_nps'
    group by dbt_cloud_user_id

),

enriched as (

    select
    
        users.user_id,
        users.instance_name || '/' || users.tenant_user_id as visitor_id,
        users.name as user_name,
        users.email,

        -- booleans
        users.is_active,
        users.is_staff,
        users.is_superuser,
        users.is_fishtown_user,
        users.is_account_creator = 1 as is_account_creator,
        users.is_verified,
        users.is_trained,

        -- timestamps
        users.first_ide_session_at,
        users.last_ide_session_at,
        nps_feedback.last_nps_at,

        -- aggregates
        users.count_associated_accounts,
        users.self_service_account_member_count,
        users.self_service_account_owner_count,
        users.count_ide_sessions
    
    from users
    left join nps_feedback 
        on users.user_id = nps_feedback.user_id

),

final as (

    select
        enriched.*
    from enriched

)

select * from final