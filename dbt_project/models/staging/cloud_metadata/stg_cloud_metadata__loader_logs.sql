with

source as (

     select * from {{ source('cloud_metadata', 'loader_logs') }}

),

renamed as (

    select
        id as loader_log_id,
        account_id,
        run_id,
        environment_id,
        job_definition_id,
        project_id,
        status_message,
        artifact_s3_path,
        case
            when status = 3
                then 'Running'
            when status = 10
                then 'Success'
            when status = 20
                then 'Error'
            else 
                'Cancelled'
        end as status,
        created_at,
        updated_at,
        finished_at,
        errored_at,
        cancelled_at

    from source

)

select * from renamed