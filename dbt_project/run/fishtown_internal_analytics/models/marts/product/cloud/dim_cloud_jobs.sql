
  
    

        create or replace transient table analytics_dev.dbt_jstein.dim_cloud_jobs  as
        (

with 

job_definitions_before_cleaning as (

    select * from analytics_dev.dbt_jstein.int_cloud_job_version_enriched

),

dbt_versions_cleaned as (

    select * from analytics_dev.dbt_jstein.int_cloud_job_dbt_versions_cleaned

),

runs as (

    select * from analytics_dev.dbt_jstein.stg_cloud__runs

),

job_definitions as (
-- due to inconsistent version naming in the jobs, we had to implement a python/regex fix

    select
        *,
        dbt_version_cleaned as dbt_semantic_version
        
    from job_definitions_before_cleaning
    left join dbt_versions_cleaned
        on job_definitions_before_cleaning.dbt_version_run = dbt_versions_cleaned.dbt_version_run

),

last_run_table as (

    select
        job_definition_id,
        max(finished_at) as last_run,
        min(finished_at) as first_run

    from runs
    group by job_definition_id

),

flattened as (

    select

        job_definition_id,
        step.value::string as step_value,

        -- Run, Test, Snapshot, and Seed steps are also run via dbt Build
        -- therefore, we are including build commands to indicate if these are run
        case
            when step_value ilike any ('%dbt run%','%dbt build%') then 1
            else 0
        end as step_has_run,

        case
            when step_value ilike any ('%dbt test%', '%dbt build%') then 1
            else 0
        end as step_has_test,

        case
            when step_value ilike '%dbt build%' then 1
            else 0
        end as step_has_build,

        case
            when step_value ilike '%dbt source%' then 1
            else 0
        end as step_has_source,

        case
            when step_value ilike '%exposure%' then 1
            else 0
        end as step_has_exposure,

        case
            when step_value ilike any ('%dbt snapshot%','%dbt build%') then 1
            else 0
        end as step_has_snapshot,

        case
            when step_value ilike any ('%dbt seed%','%dbt build%') then 1
            else 0
        end as step_has_seed,

        case
            when step_value ilike '% --models %'
                or step_value ilike '% -m %'
                or step_value ilike '% --select %' or step_value ilike '% -s %'
                or step_value ilike '% --selector %'
                then 1
            else 0
        end as step_has_selection,

        case
            when step_value ilike '%state:modified%' then 1
            else 0
        end as step_has_state_modified_selection

    from job_definitions,
    lateral flatten (input => execute_steps) step

),

aggregated as (

    select

        job_definition_id,
        count(*) as count_steps,
        sum(step_has_run) as count_steps_run,
        sum(step_has_test) as count_steps_test,
        sum(step_has_build) as count_steps_build,
        sum(step_has_source) as count_steps_source,
        sum(step_has_exposure) as count_steps_exposure,
        sum(step_has_snapshot) as count_steps_snapshot,
        sum(step_has_seed) as count_steps_seed,
        sum(step_has_selection) as count_steps_with_selection,
        sum(step_has_state_modified_selection) as count_steps_with_state_modified_selection,
        max(step_has_run::int)
            + max(step_has_test::int)
            + max(step_has_source::int)
            + max(step_has_snapshot::int)
            + max(step_has_seed::int) as count_resource_types

    from flattened
    group by 1

),

final as (

    select
        job_definitions.*,
        last_run_table.first_run,
        last_run_table.last_run,
        aggregated.count_steps,
        aggregated.count_steps_run,
        aggregated.count_steps_test,
        aggregated.count_steps_build,
        aggregated.count_steps_source,
        aggregated.count_steps_exposure,
        aggregated.count_steps_snapshot,
        aggregated.count_steps_seed,
        aggregated.count_steps_with_selection,
        aggregated.count_steps_with_state_modified_selection,
        aggregated.count_resource_types,

        case
            when deferring_job_definition_id is not null
                and coalesce(count_steps_with_state_modified_selection, 0) > 0
                then true
            else false
        end as is_slim_build

    from job_definitions
    left join aggregated using (job_definition_id)
    left join last_run_table using (job_definition_id)

)

select * from final
        );
      
  