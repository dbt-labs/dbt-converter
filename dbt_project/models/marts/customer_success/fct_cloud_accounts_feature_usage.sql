with jobs as (

    select * from {{ref('dim_cloud_jobs')}}
    where is_job_definition_deleted = 0

),

cloud_account_activities as (

    select * from {{ ref('fct_cloud_account_activities') }}

), 

cloud_accounts as (

     select * from {{ ref('fct_cloud_accounts') }}

),

jobs_joined as (

    select
        jobs.*,
        cloud_accounts.customer_id,
        cloud_accounts.is_paying_account,
        cloud_accounts.is_current_paying_account,
        cloud_accounts.first_used_ide_at,
        cloud_accounts.last_used_ide_at
    from jobs
    left join cloud_accounts using (account_id)

),

jobs_aggregated as (

    select 

        account_id as cloud_account_id,
        customer_id,
        is_paying_account,
        is_current_paying_account,
        first_used_ide_at,
        last_used_ide_at,
        max(case when triggers_schedule = true then 1 else 0 end) as has_scheduled_jobs, 
        max(case 
                when triggers_github_webhook = true 
                    then 1  
                when triggers_git_provider_webhook = true 
                    then 1 
                else 0 
            end) as has_pr_builds,
        max(case when is_slim_build = true then 1 else 0 end) as has_slim_ci,
        max(case when generate_docs = true then 1 else 0 end) as has_docs,
        max(case when count_steps_test > 0 then 1 else 0 end) as has_tests,

        min(case when generate_docs = true then first_run else null end) as first_docs_job_at,
        max(case when generate_docs = true then last_run else null end) as last_docs_job_at, 

        min(case when count_steps_test > 0 then first_run else null end) as first_tests_job_at,
        max(case when count_steps_test > 0 then last_run else null end) as last_tests_job_at, 

        min(case when triggers_schedule = true  then first_run else null end) as first_scheduled_job_run_at,
        max(case when triggers_schedule = true  then last_run else null end) as last_scheduled_job_run_at,

        min(case when triggers_github_webhook = true then first_run else null end) as first_ci_job_at,
        max(case when triggers_github_webhook = true then last_run else null end) as last_ci_job_at,

        min(case when is_slim_build = true  then first_run else null end) as first_slim_build_at, 
        max(case when is_slim_build = true  then last_run else null end) as last_slim_build_at


    from jobs_joined
    group by 1,2,3,4,5,6

),

-- Creates an event table from the above aggregated view:

scheduled_jobs as (

    select 
        cloud_account_id,
        customer_id,
        is_paying_account,
        is_current_paying_account,

        'scheduled_job' as feature_name,
        has_scheduled_jobs as in_use,
        first_docs_job_at as first_used_timestamp,
        last_docs_job_at as last_used_timestamp

    from jobs_aggregated

),

tests as (

     select
        cloud_account_id,
        customer_id,
        is_paying_account,
        is_current_paying_account,

        'tests' as feature_name,
        has_tests as in_use,
        first_tests_job_at as first_used_timestamp,
        last_tests_job_at as last_used_timestamp

    from jobs_aggregated   


), 

docs as (

    select
        cloud_account_id,
        customer_id,
        is_paying_account,
        is_current_paying_account,
        

        'docs' as feature_name,
        has_docs as in_use,
        first_docs_job_at as first_used_timestamp,
        last_docs_job_at as last_used_timestamp

    from jobs_aggregated

),

ci_builds as (

    select
        cloud_account_id,
        customer_id,
        is_paying_account,
        is_current_paying_account,

        'ci_builds' as feature_name,
        has_pr_builds as in_use,
        first_ci_job_at as first_used_timestamp,
        last_ci_job_at as last_used_timestamp

    from jobs_aggregated

),

slim_ci as (

    select
        cloud_account_id,
        customer_id,
        is_paying_account,
        is_current_paying_account,

        'slim_ci' as feature_name,
        has_slim_ci as in_use,
        first_slim_build_at as first_used_timestamp,
        last_slim_build_at as last_used_timestamp

    from jobs_aggregated

),

ide_usage as (

    select
        cloud_account_id,
        customer_id,
        is_paying_account,
        is_current_paying_account,

        'browser_based_ide' as feature_name,
        case
            when last_used_ide_at >= dateadd(day, -31, current_date())
                then 1
            else 0
        end as in_use,

        first_used_ide_at as first_used_timestamp,
        last_used_ide_at as last_used_timestamp

    from jobs_aggregated

),

unioned as (

    select * from scheduled_jobs
    union all 
    select * from tests
    union all 
    select * from docs
    union all 
    select * from ci_builds 
    union all 
    select * from slim_ci
    union all
    select * from ide_usage
), 

with_id as (

    select
        *,
        {{  dbt_utils.generate_surrogate_key([
            'cloud_account_id',
            'feature_name',
        ]) }} as id,
        'customer_health' as event_type

    from unioned
)


select * from with_id 