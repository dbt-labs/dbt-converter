with

internal_enrollments as (

    select * from {{ ref('stg_thinkific__enrollments') }}
    where is_internal_course = true

),

employees as (

    select * from {{ ref('dim_employees') }}

),

enrolled_work_email as (

    select * from internal_enrollments
    where user_email_domain in (
        'dbtlabs.com',
        'fishtownanalytics.com'
    )

),

enrolled_personal_email as (

    select *  from internal_enrollments
    where user_email_domain not in (
        'dbtlabs.com',
        'fishtownanalytics.com'
    )

),

-- First instance of employee data for onboarding progress
employees_first_records as (

    select distinct
        -- Non timeseries
        work_email,
        preferred_name,

        -- Timeseries
        first_value(reports_to_name) ignore nulls over (
            partition by worker_id
            order by valid_from
        ) as first_reports_to_name,
        first_value(department_name) ignore nulls over (
            partition by worker_id
            order by valid_from
        ) as first_department_name,
        first_value(business_entity_name) ignore nulls over (
            partition by worker_id
            order by valid_from
        ) as first_business_entity_name

    from employees

),

joined_work_email as (

    select
        enrolled_work_email.*,
        employees_first_records.first_reports_to_name,
        employees_first_records.first_department_name,
        employees_first_records.first_business_entity_name

    from enrolled_work_email
    left join employees_first_records
        on enrolled_work_email.user_email = employees_first_records.work_email

),

joined_personal_email as (

    select
        enrolled_personal_email.*,
        employees_first_records.first_reports_to_name,
        employees_first_records.first_department_name,
        employees_first_records.first_business_entity_name

    from enrolled_personal_email
    left join employees_first_records
        on enrolled_personal_email.user_name = employees_first_records.preferred_name

),

final as (

    select * from joined_work_email
    union
    select * from joined_personal_email
)

select * from final
