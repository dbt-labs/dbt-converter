with 

adp_dei_values as (

    select * from {{ ref('int_dei_align_adp_values') }}

),

person_disability as (

    select * from {{ ref('stg_adp__person_disability') }}
    
),

employees as (

    select * from {{ ref('dim_employees') }}
    where is_most_recent_employee_record = true

),

form_responses as (

    select * from {{ ref('int_dei_align_diversity_form_values') }}

),

adp_joined as (

    select 
        employees.work_email,
        employees.job_title,
        employees.department_name,
        employees.org,
        employees.technical_classification,
        employees.business_entity_name,
        employees.is_worker_outside_of_usa,

        adp_dei_values.worker_id,
        adp_dei_values.gender_identity,
        adp_dei_values.ethnicity,
        adp_dei_values.eeo_racial_identity,
        adp_dei_values.dei_ethnicity_and_race,
        adp_dei_values.age_bucket,

        person_disability.disability,

        employees.hired_at,
        employees.official_termination_date as terminated_at
    
    from employees
    left join person_disability
        on employees.worker_id = person_disability.worker_id
    left join adp_dei_values
        on employees.worker_id = adp_dei_values.worker_id
    where employees.work_email is not null

),

coalesce_cross_source as (

    select
        adp_joined.worker_id,

        adp_joined.job_title,
        adp_joined.org,
        adp_joined.technical_classification,
        adp_joined.business_entity_name,
        adp_joined.is_worker_outside_of_usa,
        coalesce(
            form_responses.gender_identity,
            adp_joined.gender_identity
        ) as gender_identity,
        adp_joined.ethnicity,
        coalesce(
            form_responses.eeo_racial_identity,
            adp_joined.eeo_racial_identity
        ) as eeo_racial_identity,
        coalesce(
            form_responses.dei_ethnicity_and_race,
            adp_joined.dei_ethnicity_and_race,
            'Not Specified'
        ) as dei_ethnicity_and_race,
        adp_joined.age_bucket,
        coalesce(
            adp_joined.disability,
            form_responses.disability
        ) as disability,
        form_responses.caregiver,
        form_responses.lgbtqia,
        form_responses.highest_education,
 
        form_responses.submitted_at,
        adp_joined.hired_at,
        adp_joined.terminated_at

    from adp_joined
    left join form_responses
        on adp_joined.work_email = form_responses.email_address
    
)

select * from coalesce_cross_source