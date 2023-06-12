with 

finance_transfers as (

    select * from {{ ref('stg_googlesheets__finance_transfers') }}
    where is_transfer_valid = true

),

employees as (

    select * from {{ ref('dim_employee_roster') }}
    where employment_status != 'Terminated'

),


internal_offers as (

    select * from {{ ref('fct_greenhouse_job_offers') }}
    where job_id_error = false
        and offer_status = 'accepted'
        and application_source = 'Internal Applicant'
        and offer_rank = 1

),

forecasted_transfers as (

    select
        forecasted_job_id,
        worker_id,
        employee_name,
        transfer_in_date,
        transfer_salary,
        'Forecasted' as transfer_type

    from finance_transfers

),

transfer_offers as (

    select
        finance_job_id,
        internal_applicant_worker_id as worker_id,
        candidate_name as employee_name,
        start_date as transfer_in_date,
        salary as transfer_salary,
        'Offer' as transfer_type

    from internal_offers

),

all_transfers as (

    select * from forecasted_transfers

        union all

    select * from transfer_offers


),

duplicate_test as (

    select 
        *,

        count(*) over(partition by forecasted_job_id) as record_count

    from all_transfers

),

remove_duplicates as (

    select *
    from duplicate_test
    where record_count = 1
        or (record_count = 2
            and transfer_type = 'Offer')
),

augmented as (

    select 
        
        remove_duplicates.*,

        employees.job_id as current_job_id,
        employees.hire_date as transfer_hire_date,
        employees.adp_salary::int as prior_salary

    from remove_duplicates
    left join employees
        on remove_duplicates.worker_id = employees.worker_id


)

select * from augmented