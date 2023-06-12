with

source as (

    select * from raw.fivetran_dbt_cloud.runs
    where in_progress = false

),

final as (

    select
        id as run_id,
        environment_id,
        job_id,
        job_definition_id,

        status_humanized as status,
        href,
        dbt_version,
        git_branch,
        git_sha,

        -- need include run steps in fivetran function for more data
        run_steps,

        is_complete,
        is_success,
        is_error,
        is_cancelled,
        has_docs_generated,
        artifacts_saved as has_artifacts,

        run_duration,
        started_at::timestamp as started_at,
        finished_at::timestamp as finished_at

    from source

)

select * from final