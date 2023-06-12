
  
    

        create or replace transient table analytics_dev.dbt_jstein.fct_cloud_users  as
        (

with

accounts as (

    select * from analytics_dev.dbt_jstein.stg_cloud__accounts
    where is_account_deleted = 0

),

users as (

    select * from analytics_dev.dbt_jstein.stg_cloud__users

),

ide_use as (

    select * from analytics_dev.dbt_jstein.stg_cloud__develop_requests
),

learn as (

    select * from analytics_dev.dbt_jstein.dim_all_learners

),

user_accounts as (

    select * from analytics_dev.dbt_jstein.fct_cloud_user_account_mappings
    where is_account_deleted = 0
    and is_user_license_deleted = 0

),

user_feature_flags as (

    select * from analytics_dev.dbt_jstein.stg_cloud__user_feature_flags
    where is_user_feature_flag_deleted = 0

),

salesforce_contacts as (

    select * from analytics_dev.dbt_jstein.stg_salesforce__cloud_user_mappings

),

tenants as (

    select * from analytics_dev.dbt_jstein.dim_cloud_tenants

),

ide_sessions as (

    select
        user_id,
        count(*) as count_ide_sessions,
        min(created_at) as first_ide_session_at,
        max(created_at) as last_ide_session_at

    from ide_use
    where is_successful_session = 1
    group by 1

),

user_account_details as (

    select distinct
        user_accounts.user_id,
        user_accounts.account_id,
        accounts.created_at as account_created_at,
        user_accounts.is_account_creator,

        coalesce(ide_sessions.count_ide_sessions, 0) as count_ide_sessions,
        ide_sessions.first_ide_session_at,
        ide_sessions.last_ide_session_at
    
    from user_accounts
    inner join accounts
        on user_accounts.account_id = accounts.account_id
    inner join users
        on user_accounts.user_id = users.user_id
    left join ide_sessions
        on user_accounts.user_id = ide_sessions.user_id

),

user_flags as (

    select
        user_id,
        arrayagg(feature_name) as feature_flags

    from user_feature_flags
    group by 1

),

users_aggregated as (

    select
        user_id,
        max(
            case when is_account_creator then 1 else 0 end
        ) as is_account_creator,
        count(distinct case
                            when is_account_creator
                                then account_id
                        end
        ) as count_created_accounts,
        coalesce(count(distinct account_id), 0) as count_associated_accounts,
        coalesce(max(count_ide_sessions), 0) as count_ide_sessions,
        min(first_ide_session_at) as first_ide_session_at,
        max(last_ide_session_at) as last_ide_session_at

    from user_account_details
    group by 1

),

last_signup_source as (

    select 
    
        user_id,
        account_id,
        is_self_service_owner,
        is_self_service_member,
        is_verified,
        last_value(sign_up_source) over (partition by user_id order by account_id) as sign_up_source

    from user_accounts

),

group_info as (

    select
        user_id,
        is_verified,
        sign_up_source,
        count(distinct case when is_self_service_owner then account_id else null end) as self_service_account_owner_count,
        count(distinct case when is_self_service_member then account_id else null end) as self_service_account_member_count

    from last_signup_source
    group by 1,2,3

),

final as (

    select
        users.*,
        tenants.instance_name,

        coalesce(users_aggregated.is_account_creator,0) as is_account_creator,
        coalesce(users_aggregated.count_created_accounts,0) as count_created_accounts,
        coalesce(users_aggregated.count_associated_accounts,0) as count_associated_accounts,
        coalesce(users_aggregated.count_ide_sessions,0) as count_ide_sessions,
        users_aggregated.first_ide_session_at,
        users_aggregated.last_ide_session_at,

        case 
            when users.database_type = 'single-tenant'
                then 1
            else coalesce(group_info.is_verified, 0) 
        end as is_verified,
        group_info.sign_up_source,
        group_info.self_service_account_member_count,
        group_info.self_service_account_owner_count,

        

    --Learn info
        case
            when learn.learner_email is not null
                then 1
            else 0
        end as enrolled_in_learn,
        coalesce(learn.is_trained, false) as is_trained,
        learn.attended_courses,

        user_flags.feature_flags,

        salesforce_contacts.contact_id as salesforce_contact_id

    from users
    left join users_aggregated
        on users.user_id = users_aggregated.user_id
    left join group_info
        on users.user_id = group_info.user_id
    left join learn
        on users.email = learn.learner_email
    left join user_flags
        on users.user_id = user_flags.user_id
    left join salesforce_contacts
        on users.user_id = salesforce_contacts.cloud_user_id
    left join tenants
        on users.database_source = tenants.database_source

)

select * from final
        );
      
  