with

source as (

    select * from raw.fivetran_google_sheets_finance.terminated_employees

),

renamed as (

    select
        associate_oid,
        worker_id,
        job_id,
        primary_work_assignment_id as primary_worker_assignment_id,

        given_name as legal_first_name,
        family_name as legal_last_name,
        formatted_name as legal_formatted_name,

        termination_date as terminated_at,
        rehire_date as rehired_at,
        last_day_worked as last_day_worked_at

    from source

)

select * from renamed