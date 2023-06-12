with

projects as (

    select * from {{ ref('dim_cloud_projects') }}
    where instance_name is not null

),


repos as (

    select * from {{ ref('stg_cloud__repos') }}
    where is_repo_deleted = 0

),

enriched as (

    select

        -- identifiers
        concat(
            projects.instance_name,
            '/',
            projects.tenant_account_id,
            '::',
            projects.instance_name,
            '/',
            projects.tenant_project_id
        ) as pendo_account_id,
        projects.project_id,

        -- timestamps
        projects.first_connection_created_at,

        -- git attributes
        repos.git_provider,
        repos.git_clone_strategy

    from projects
    left join repos
        on projects.repository_id=repos.repository_id

),

final as (

    select
        enriched.*
    from enriched

)

select * from final