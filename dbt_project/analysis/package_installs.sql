with package_installs as (

    select * from {{ ref('fct_dbt_package_installs') }}

),

aggregated as (

    select
        full_package_name,
        count(distinct project_id) as distinct_projects,
        count(distinct case when package_installation_method = 'git' then project_id end) as distinct_projects_using_git_syntax,
        count(distinct case when package_installation_method = 'hub' then project_id end) as distinct_projects_using_hub_syntax,
        count(*) as installs

    from package_installs

    where full_package_name is not null
        and package_owner is not null
        and installed_at >= '2020-04-01'

    group by 1

)

select * from aggregated

order by distinct_projects desc
