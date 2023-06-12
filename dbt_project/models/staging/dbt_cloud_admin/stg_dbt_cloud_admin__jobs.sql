with

source as (

    select * from {{ source('dbt_cloud_admin', 'jobs') }}

),

final as (

    select
        id as job_id,
        environment_id,

        name as job_name,

        settings:target_name::string as target_name,
        settings:threads::number as threads,

        case
            when job_name ilike '[Prod]%'
                then true
            else false
        end as is_production_job,

        deactivated as is_deactivated,
        case
            when state = 2
                then true
            else false
        end as is_deleted,

        created_at,
        updated_at

    from source

)

select * from final