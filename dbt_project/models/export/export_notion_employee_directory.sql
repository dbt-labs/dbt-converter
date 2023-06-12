with

source as (

    select * from {{ ref('dim_employee_daily_summary') }}
    where is_most_recent_record = True

),

final as (

    select
        worker_id,
        preferred_full_name,
        reports_to_preferred_full_name,
        hired_at,
        job_title,
        employee_status,
        legal_address_country_code,
        legal_address_state_territory,
        management_position,
        work_email,
        department_name,
        cost_center_code

    from source
    
)

select * from final