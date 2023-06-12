with

users as (

    select * from {{ ref('int_cloud__users_joined') }}

),

accounts as (

    select * from {{ref('stg_cloud__accounts')}}

),

cloud_sfdc_accounts as (

    select * from {{ref('cloud_account_mappings')}}

),

partner_connect_accounts as (
    
    select * from {{ ref('int_cloud__partner_connect_signups_unioned') }}
    
),

groups as (

    select * from {{ ref('stg_cloud__groups') }}
    where is_group_deleted = 0

),

user_groups as (

    select * from {{ ref('stg_cloud__user_groups') }}
    where is_user_group_deleted = 0

),

user_licenses as (

    select * from {{ ref('int_cloud__user_account_licenses') }}

),

user_account_creators as (
-- the below logic allows us to identify the first user associated with an account, and designates them the account creator

    select
        user_id,
        account_id,
        true as is_account_creator,
        row_number() over (
            partition by user_id
            order by created_at
        ) as user_account_creation_index
    
    from user_licenses
    qualify row_number() over (
        partition by account_id
        order by created_at
    ) = 1

),

groups_flattened as (
    -- since the sso_mapping_group is already an array, it needs to be flattened and then re-aggregated downstream
    select
        group_id,
        group_name,
        value::string as sso_mapping_group
    
    from groups,
    lateral flatten (
        input => sso_mapping_groups,
        outer => true
    )

),

user_license_groups as (
    --TODO: we should join group_name to the `stg_cloud__user_groups` model
    select
        user_license_id,
        arrayagg(distinct groups_flattened.group_name) within group (order by groups_flattened.group_name) as groups,
        arrayagg(distinct groups_flattened.sso_mapping_group) within group (order by groups_flattened.sso_mapping_group) as sso_mapping_groups,
        max(case when groups_flattened.group_name = 'Owner' then true else false end) as is_self_service_owner,
        max(case when groups_flattened.group_name = 'Member' then true else false end) as is_self_service_member

    from user_groups
    left join groups_flattened
        on user_groups.group_id = groups_flattened.group_id
    group by 1

),

first_user_account_license as (
    --a user on an account can be removed/readded to an account
    --so we want to take the first license status on the account
    --in order to accurately capture the initial point of association

    select
        *,
        row_number() over (
            partition by user_id, account_id
            order by created_at 
        ) as first_license_index

    from user_licenses
    qualify first_license_index = 1

),


last_user_account_license as (
    --a user on an account can be removed/readded to an account
    --so we want to take the latest license status on the account
    --in order to prioritize more recent activity in identifying 
    --primary accounts. 

    select
        *,
        row_number() over (
            partition by user_id, account_id
            order by updated_at desc
        ) as last_license_index

    from user_licenses
    qualify last_license_index = 1

),

permissions_joined as (

    select
        last_user_account_license.user_id,
        last_user_account_license.account_id,
        last_user_account_license.user_license_id,
        last_user_account_license.tenant_user_license_id,
        cloud_sfdc_accounts.salesforce_account_id,
        cloud_sfdc_accounts.sfdc_parent_account_id,
        cloud_sfdc_accounts.stripe_customer_id,
        cloud_sfdc_accounts.customer_id,

        cloud_sfdc_accounts.is_paying_account,
        cloud_sfdc_accounts.is_current_paying_account,
        cloud_sfdc_accounts.is_primary_cloud_account,
        accounts.database_type,
        accounts.is_account_deleted,
        accounts.is_partner_training_acct,
        accounts.plan,
        accounts.plan_tier,
        last_user_account_license.is_user_license_deleted,
        last_user_account_license.license_type,

        --note: by the nature of the first_user_account_license CTE above,
        --this could be a different LICENSE than the last_user_account_license
        --but is still useful for the indexes created
        first_user_account_license.created_at as user_account_association_created_at,
        
        last_user_account_license.updated_at as user_account_association_last_updated_at,
        
        partner_connect_accounts.sign_up_source,

        user_license_groups.groups,
        user_license_groups.sso_mapping_groups,
        user_license_groups.is_self_service_owner,
        user_license_groups.is_self_service_member,
        user_account_creators.is_account_creator,
        user_account_creators.user_account_creation_index

    from last_user_account_license
    left join accounts
        on last_user_account_license.account_id = accounts.account_id
    left join cloud_sfdc_accounts
        on last_user_account_license.account_id = cloud_sfdc_accounts.account_id
    left join user_license_groups
        on last_user_account_license.user_license_id = user_license_groups.user_license_id
    left join partner_connect_accounts
        on last_user_account_license.account_id = partner_connect_accounts.dbt_cloud_account_id
    left join user_account_creators
        on last_user_account_license.user_id = user_account_creators.user_id
            and last_user_account_license.account_id = user_account_creators.account_id
    left join first_user_account_license
        on last_user_account_license.user_id = first_user_account_license.user_id
            and last_user_account_license.account_id = first_user_account_license.account_id

),

users_with_accounts as (
--joining the permissions_joined to users because some users might not have an account
    select
        users.user_id,
        permissions_joined.account_id,
        permissions_joined.user_license_id,
        permissions_joined.tenant_user_license_id,
        permissions_joined.salesforce_account_id,
        permissions_joined.sfdc_parent_account_id,
        permissions_joined.stripe_customer_id,
        permissions_joined.customer_id,
        permissions_joined.is_paying_account,
        permissions_joined.is_current_paying_account,
        permissions_joined.is_primary_cloud_account,
        permissions_joined.is_partner_training_acct,
        permissions_joined.is_account_deleted,
        permissions_joined.database_type,

        users.email,
        permissions_joined.plan,
        permissions_joined.plan_tier,
        permissions_joined.license_type,
        permissions_joined.sign_up_source,
        permissions_joined.groups,
        permissions_joined.sso_mapping_groups,

        permissions_joined.is_user_license_deleted,
        users.is_fishtown_user,
        users.is_verified,
        coalesce(permissions_joined.is_self_service_owner,0) as is_self_service_owner,
        coalesce(permissions_joined.is_self_service_member,0) as is_self_service_member,
        coalesce(permissions_joined.is_account_creator,false) as is_account_creator,

        permissions_joined.user_account_association_created_at,
        permissions_joined.user_account_creation_index,
        permissions_joined.user_account_association_last_updated_at,

        -- Note that this excludes deleted associations
        sum(case when is_user_license_deleted = 0 then 1 else 0 end) over (
            partition by users.email, salesforce_account_id
            order by is_primary_cloud_account desc, user_account_association_created_at
            rows between unbounded preceding and current row
        ) as user_license_account_index,

        sum(case when is_user_license_deleted = 0 and plan_tier = 'enterprise' then 1 else 0 end) over (
            partition by users.email, salesforce_account_id, plan_tier
            order by is_primary_cloud_account desc, user_account_association_created_at desc
            rows between unbounded preceding and current row
        ) as user_license_enterprise_acct_index,

        -- Note that this excludes deleted associations
        coalesce(user_license_enterprise_acct_index = 1, false) as is_last_associated_enterprise_account,

        coalesce(user_license_account_index = 1, false) as is_first_associated_account, 

        row_number() over (
            partition by permissions_joined.account_id
            order by permissions_joined.user_account_association_created_at
        ) as account_membership_index,

        case
            when is_first_associated_account = true and is_account_creator = true
                then 'Cloud Sign Up'
            when is_first_associated_account = false and is_account_creator = true
                then 'Created New Cloud Account'
            when account_membership_index > 1
                then 'Added to Cloud Account'
            when is_user_license_deleted = 1
                then 'User License Record Deleted'
            when account_membership_index = 1 
                then 'Unusual - First User but Not Creator'
        end as user_account_relationship


    from users
    left join permissions_joined
        on users.user_id = permissions_joined.user_id

),

with_id as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'user_id',
            'account_id'
        ]) }} as user_account_id,
        *

    from users_with_accounts

)

select * from with_id
