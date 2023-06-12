with

offers as (

    select * from {{ ref('stg_greenhouse__job_offers') }}

),

openings as (

    select * from {{ ref('fct_greenhouse_job_openings') }}

),

applications as (

    select * from {{ ref('int_greenhouse_job_applications') }}

),

synth as (

    select 

        -- ids
        offers.offer_id,
        offers.application_id,
        openings.job_id,
        openings.finance_job_id,
        openings.job_function_code,
        offers.internal_applicant_worker_id,

        -- dimensions
        offers.position_title,
        offers.position_level,
        openings.job_name,
        offers.employment_type,
        applications.source_name as application_source,

        case
            when application_source = 'Internal Applicant'
                then null
            else offers.candidate_name
        end as candidate_name,

        offers.hiring_manager, 
        offers.hiring_manager_email,

        openings.location,
        openings.location_country,
        offers.location_state,
        offers.location_city,

        openings.l0_department_name,
        openings.l1_department_name,

        offers.salary_currency,
        offers.signing_bonus_currency,
        offers.commission_currency,
        
        -- measures
        offers.salary,
        offers.equity_amount,
        offers.signing_bonus_amount,
        offers.commission_amount,

        -- date/times
        offers.created_at :: date as created_date,
        offers.updated_at,
        offers.sent_at,
        offers.resolved_at,
        offers.expiration_date,
        offers.start_date,
        date_trunc('month',offers.start_date) as start_month,

        -- other flags
        offers.offer_status,
        offers.offer_version,
        openings.job_id_error,
        row_number() over(partition by openings.finance_job_id order by created_at desc) as offer_rank

    from offers
    left join applications
        on offers.application_id = applications.application_id
    left join openings
        on applications.application_id = openings.application_id

)

select * from synth