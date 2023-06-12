with

 openings as (

    select * from {{ ref('stg_greenhouse__job_openings') }}

),

jobs as (

    select * from {{ ref('int_greenhouse_jobs') }}

),

augmented as (

    select 

        -- ids
        openings.job_opening_id,
        openings.job_id,
        openings.finance_job_id,
        openings.application_id,
        jobs.job_function_code,

        -- dimensions
        jobs.job_name,

        openings.job_opening_status,
        jobs.job_status,
        openings.job_opening_reason,

        jobs.l0_department_name,
        jobs.l1_department_name,

        jobs.office_name as location,
        jobs.location_country,

        openings.job_opening_hiring_manager as hiring_manager,
        jobs.hiring_manager_email,

        jobs.salary_currency,

        -- measures
        jobs.minimum_salary,
        jobs.midpoint_salary,
        jobs.maximum_salary,

        -- date/times
        openings.opened_at :: date as opened_date,
        openings.closed_at :: date as closed_date,
        
        date_trunc('month',opened_date) as opened_month,


        -- other flags
        openings.job_id_error
    
    from openings
    left join jobs
        on openings.job_id = jobs.job_id
    
)

select * from augmented