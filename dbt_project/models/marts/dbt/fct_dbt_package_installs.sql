{{ config(
    materialized='incremental'
) }}


with package_installs as (

    select * from {{ ref('stg_dbt_package_installs') }}
    where 1=1

    {% if target.name in ['dev', 'default'] %}

        and installed_at >= dateadd(d, -{{var('testing_days_of_data')}}, current_date)
    
    {% endif %}
    
    {% if is_incremental() %}

        and installed_at >= (select max(installed_at) from {{ this }})

    {% endif %}


),

known_packages as (

    select
        *,

        -- handle the fact that an org might have different names on GitHub and GitLab.
        -- Like our friends on the GitLab data team
        case
            when organization = 'gitlabhq'
                then 'gitlab-data'
            else organization
        end as organization_gitlab_name,

        organization || '/' || package_name as full_package_name,
        md5(full_package_name) as hashed_package_name,


        -- some packages previously used hyphens, e.g. fishtown-analytics/dbt-utils. Account for that here
        organization || '/' || repo_name as previous_package_name,
        md5(previous_package_name) as hashed_previous_package_name,

        'git@github.com:' || organization || '/' || repo_name || '.git' as github_ssh_url,
        md5(github_ssh_url) as hashed_github_ssh_url,

        'https://github.com/' || organization ||'/' || repo_name || '.git' as github_https_url,
        md5(github_https_url) as hashed_github_https_url,

        'git@gitlab.com:' || organization_gitlab_name || '/' || repo_name || '.git' as gitlab_ssh_url,
        md5(gitlab_ssh_url) as hashed_gitlab_ssh_url,

        'https://gitlab.com/' || organization_gitlab_name ||'/' || repo_name || '.git' as gitlab_https_url,
        md5(gitlab_https_url) as hashed_gitlab_https_url

    from {{ ref('stg_hub_packages') }}

),

joined as (

    select
        package_installs.event_id,
        package_installs.invocation_id,
        package_installs.installed_at,
        package_installs.project_id,

        coalesce(
            known_packages.full_package_name,
            package_installs.package_name
        ) as full_package_name,

        package_installs.package_installation_method,
        package_installs.package_version,
        package_installs.dbt_version,

        known_packages.organization as package_owner,
        known_packages.repo_name as package_repo_name,
        known_packages.package_name

    from package_installs

    left join known_packages
        -- use an OR condition to handle the fact that the package name may or may not be hashed, and may or may not have hyphens/underscores
        on (package_installs.package_name = known_packages.hashed_package_name
            or package_installs.package_name = known_packages.hashed_previous_package_name
            or package_installs.package_name = known_packages.full_package_name
            or package_installs.package_name = known_packages.previous_package_name
            or package_installs.package_name = known_packages.hashed_github_ssh_url
            or package_installs.package_name = known_packages.hashed_github_https_url
            or package_installs.package_name = known_packages.hashed_gitlab_ssh_url
            or package_installs.package_name = known_packages.hashed_gitlab_https_url
        )

)

select * from joined
