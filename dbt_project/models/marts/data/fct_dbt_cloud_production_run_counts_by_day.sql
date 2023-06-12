with

runs as (

    select * from {{ ref('stg_dbt_cloud_admin__runs') }}

),

jobs as (

    select * from {{ ref('stg_dbt_cloud_admin__jobs') }}
    where is_production_job = true

),

joined as (

    select
        jobs.job_id,
        jobs.job_name,

        {{ date_trunc('day', 'runs.finished_at') }} as run_day,

        count(*) as count_production_runs,
        sum(
            case
                when runs.status = 'Success'
                    then 1
                else 0
            end
        ) as count_successful_production_runs



    from runs
    inner join jobs
        on runs.job_id = jobs.job_id
    group by 1, 2, 3

),

final as (

    select
        *,
        count_successful_production_runs / count_production_runs as percent_successful_prod_jobs
    
    from joined

)

select * from final