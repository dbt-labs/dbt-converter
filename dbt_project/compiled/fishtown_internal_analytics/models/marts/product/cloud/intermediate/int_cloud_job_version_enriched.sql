with 

job_definitions as (

    select * from analytics_dev.dbt_jstein.stg_cloud__job_definitions

),

environments as (

    select * from analytics_dev.dbt_jstein.dim_cloud_environments

),

environment_variables as (

    select * from analytics_dev.dbt_jstein.stg_cloud__environment_variables
    where precedence_level = 'job'
      and is_env_var_deleted = 0

),

available_runtime_versions as(

    select * from analytics_dev.dbt_jstein.dbt_cloud_runtime_image_versions

),

environment_join as (

    select
        job_definitions.*,

        coalesce(
            job_definitions.dbt_version,
            environments.dbt_version
        ) as dbt_version_run,

        coalesce(environments.count_environment_variables, 0) as count_environment_variables,
        environments.configured_environment_variables

  from job_definitions
  left join environments using (environment_id)

),

enrich_version_details as(

    select
        environment_join.*,
        coalesce(available_runtime_versions.is_supported_version,0) as is_supported_version,
        coalesce(available_runtime_versions.is_latest_major,0) as is_latest_major,
        coalesce(available_runtime_versions.is_latest_minor,0) as is_latest_minor,
        coalesce(available_runtime_versions.is_latest_patch,0) as is_latest_patch


    from environment_join
    left join available_runtime_versions 
        on environment_join.dbt_version_run = available_runtime_versions.version_image_name

),

env_vars_summarized as (

    select
        job_id as job_definition_id,
        account_id,
        project_id,
        array_agg(name) as configured_environment_variables
    
    from environment_variables
    group by 1,2,3

),

final as (

    select 
        *,       
        array_intersection(
            enrich_version_details.configured_environment_variables,
            env_vars_summarized.configured_environment_variables
        ) as overridden_environment_variables,
        coalesce(
            array_size(overridden_environment_variables),
            0
        ) as count_overridden_environment_variables

    from enrich_version_details
    left join env_vars_summarized using (job_definition_id, account_id, project_id)

)

select * from enrich_version_details