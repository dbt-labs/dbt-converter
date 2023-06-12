with projects as (

    select * from {{ ref('stg_cloud__projects') }}
    where is_project_deleted = 0

),

jobs as (

    select * from {{ref('dim_cloud_jobs')}}
    where is_job_definition_deleted = 0

),

versions as (

    select * from {{ ref('dim_dbt_versions') }}

),

environments as (

    select * from {{ ref('stg_cloud__environments') }}
    where is_environment_deleted = 0

),

connections as (

    select * from {{ ref('fct_cloud_project_connections') }}

),

tenants as (

    select * from {{ ref('dim_cloud_tenants') }}

),

connections_aggregated as (
    
    select 
        project_id,
        account_id,
        count(distinct adapter) as adapter_count,
        listagg(distinct adapter,', ') within group (order by adapter) as adapters_used,
        min(created_at) as first_connection_created_at,
        max(created_at) as last_connection_created_at
    
    from connections
    group by 1,2
    
),

job_versions_aggregated as (
-- Due to difficulties ranking the semantic version stored as a string
-- (ex: 1.21.0 < 1.7.0 because 2 comes before 7), we have to get max/min
-- rank first. This captures the earliest and latest based on job versions.
    select
        project_id,
        min(versions.version_rank) as earliest_version_rank,
        max(versions.version_rank) as latest_version_rank
    
    from jobs
    left join versions
        on jobs.dbt_semantic_version = versions.dbt_semantic_version
    group by 1

),

environment_versions_aggregated as (
-- This performs the same step as the prior CTE, but for the environment version. 
    select
        project_id,
        min(versions.version_rank) as earliest_version_rank,
        max(versions.version_rank) as latest_version_rank
    
    from environments
    left join versions
        on environments.dbt_version = versions.dbt_semantic_version
        and versions.is_prerelease = false
    group by 1

),

project_version_ranks_coalesced as (
-- This step brings together the prior two CTEs to get an overall
-- min/max version for the project

    select 
        environment_versions_aggregated.project_id,
    
        -- Coalesce statements are used to combat how LEAST & GREATEST handle NULL values
        -- In particular, LEAST and GREATEST will return the NULL value if it's present at all
        least(
            environment_versions_aggregated.earliest_version_rank,
            coalesce(
                job_versions_aggregated.earliest_version_rank,
                9999) -- this ensures that a NULL value won't be lesser than any defined dbt version
        ) as earliest_version_rank,

        greatest(
            environment_versions_aggregated.latest_version_rank,
            coalesce(
                job_versions_aggregated.latest_version_rank,
                -1) -- this ensures that a NULL value won't be greater than any defined dbt version
        ) as latest_version_rank
    
    from environment_versions_aggregated
    left join job_versions_aggregated using (project_id)

),

project_dbt_versions as (
-- This step pulls back in the semantic dbt version (e.g. 1.21.0) 
    select 

        project_version_ranks_coalesced.*,
        earliest_version.dbt_semantic_version as min_dbt_version,
        latest_version.dbt_semantic_version as max_dbt_version

    from project_version_ranks_coalesced
    left join versions as earliest_version
        on project_version_ranks_coalesced.earliest_version_rank = earliest_version.version_rank
    left join versions as latest_version
        on project_version_ranks_coalesced.latest_version_rank = latest_version.version_rank
        

),

joined as (

    select
        projects.*,
        tenants.instance_name,
        connections_aggregated.adapter_count,
        connections_aggregated.adapters_used,
        connections_aggregated.first_connection_created_at,
        connections_aggregated.last_connection_created_at,
        project_dbt_versions.min_dbt_version,
        project_dbt_versions.max_dbt_version
    
    from projects
    left join connections_aggregated using (project_id)
    left join project_dbt_versions using (project_id)
    left join tenants using (database_source)

)

select * from joined