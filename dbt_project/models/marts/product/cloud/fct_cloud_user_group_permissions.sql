with

user_groups as (

    select * from {{ ref('stg_cloud__user_groups') }}
    where is_user_group_deleted = 0
    -- NOTE: the below filter is temporary since it's only available for MT accounts as of 4/19/2022
        and database_type = 'multi-tenant'

),

user_licenses as (

    select * from {{ ref('stg_cloud__user_licenses') }}
    where is_user_license_deleted = 0

),

groups as (

    select * from {{ ref('stg_cloud__groups') }}
    where is_group_deleted = 0

),

group_permissions as (

    select * from {{ ref('stg_cloud__group_permissions') }}
    where is_group_permission_deleted = 0

),

projects as (

    select * from {{ ref('stg_cloud__projects') }}
    where is_project_deleted = 0

),

cloud_sfdc_accounts as (

    select * from {{ ref('cloud_account_mappings') }}

),

joined as (

    select
        group_permissions.group_permission_id,
        user_licenses.user_id,
        user_groups.group_id,
        user_groups.group_membership_id,
        user_groups.account_id,
        cloud_sfdc_accounts.salesforce_account_id,
        projects.project_id,
        
        user_groups.database_type,
        user_licenses.license_type,
        groups.group_name,
        group_permissions.permission_level,
        group_permissions.permission_set,

        group_permissions.is_all_projects,
        cloud_sfdc_accounts.is_primary_cloud_account
    
    from user_groups
    inner join user_licenses
        on user_groups.user_license_id = user_licenses.user_license_id
    inner join groups
        on user_groups.group_id = groups.group_id
    inner join group_permissions
        on groups.group_id = group_permissions.group_id
    inner join projects
        on user_groups.account_id = projects.account_id
        and (group_permissions.project_id = projects.project_id or group_permissions.is_all_projects)
    inner join cloud_sfdc_accounts
        on user_groups.account_id = cloud_sfdc_accounts.account_id

),

with_id as (

    select
        {{dbt_utils.generate_surrogate_key([
            'group_permission_id',
            'group_membership_id',
            'project_id'
        ])}} as user_group_permission_id,
        *

    from joined

)

select * from with_id