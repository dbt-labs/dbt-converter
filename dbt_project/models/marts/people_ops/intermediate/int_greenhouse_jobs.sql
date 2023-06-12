with

jobs as (

    select * from {{ ref('stg_greenhouse__jobs') }}

),

job_offices as (

    select * from {{ ref('int_greenhouse_job_offices') }}

),

job_departments as (

    select * from {{ ref('int_greenhouse_job_departments') }}

),

hiring_managers as (

    select * from {{ ref('int_greenhouse_hiring_managers') }}

),

synth as (

    select
        -- ids
        jobs.id as job_id,
        job_departments.l0_department_id,
        job_offices.office_id,
        jobs.job_function_code,

        -- dimensions
        jobs.name as job_name,
        jobs.status as job_status,
        jobs.custom_employment_type as employment_type,
        jobs.custom_reason_for_hire as job_reason,

        hiring_managers.hiring_manager_email,

        job_departments.l0_department_name,
        job_departments.l1_department_id,
        job_departments.l1_department_name,

        job_offices.office_name,
        job_offices.location_country,

        jobs.salary_currency,

        -- measures
        jobs.minimum_salary,
        (minimum_salary + maximum_salary) / 2 as midpoint_salary,
        jobs.maximum_salary,

        jobs.min_equity_shares,
        jobs.max_equity_shares,

        -- date/times
        jobs.created_at,
        jobs.updated_at,
        jobs.closed_at,

        -- other flags
        jobs.is_template,
        jobs.confidential as is_confidential,
        row_number() over(
            partition by jobs.id
            order by hiring_managers.hiring_manager_email desc
        ) as is_multiple_managers


    from jobs
    left join job_departments
        on jobs.id = job_departments.job_id
    left join job_offices
        on jobs.id = job_offices.job_id
    left join hiring_managers
        on jobs.id = hiring_managers.job_id

),

deduped as (

    select * from synth
    where is_multiple_managers = 1

)

select * from deduped