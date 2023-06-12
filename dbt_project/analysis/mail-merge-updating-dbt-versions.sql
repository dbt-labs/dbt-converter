with users as (
    select * from {{ ref('int_cloud__users_joined') }}
),
user_groups as (
    select * from {{ref('fct_cloud_user_account_mappings')}}
),
projects as (
    select * from {{ ref('stg_cloud__projects') }}
),
environments as (
    select * from {{ ref('stg_cloud__environments') }}
),
bad_jobs as(
    select account_id, project_id, environment_id, job_definition_id, name, dbt_version
    from {{ ref('dim_cloud_jobs') }}
    where is_job_definition_deleted = 0 and is_supported_version = 0
),
info as (
    select
    bad_jobs.project_id,
    bad_jobs.account_id,
    bad_jobs.job_definition_id,
    case when bad_jobs.dbt_version is NULL 
        then environments.name || ' : ' || 'https://cloud.getdbt.com/#/accounts/' || bad_jobs.account_id || '/projects/' || bad_jobs.project_id || '/environments/' || environments.environment_id || '/' 
        else bad_jobs.name || ' : ' || 'https://cloud.getdbt.com/#/accounts/' || bad_jobs.account_id || '/projects/' || bad_jobs.project_id || '/jobs/' || bad_jobs.job_definition_id || '/' 
        end as url,
    users.user_id,
    users.email,
    users.first_name,
    users.name
    from bad_jobs
    left join user_groups
        on bad_jobs.account_id = user_groups.account_id
    left join users
        on user_groups.user_id = users.user_id
    left join environments
        on bad_jobs.environment_id = environments.environment_id
    left join projects
        on bad_jobs.project_id = projects.project_id
    where user_groups.is_account_deleted = 0 and user_groups.is_user_license_deleted = 0 and environments.is_environment_deleted = 0 and projects.is_project_deleted = 0 
),
final as (
    select
        user_id,
        first_name,
        name,
        email,
        account_id,
        listagg(distinct url, ',') as job_environment_urls
        from info
        group by 1,2,3,4,5
)

select * from final
--limit 1000000