with

source as (

    select * from raw.fivetran_adp_workforce_now.worker
    where custom_job_id is not null

),

renamed as (

    select
        id as worker_id,
        custom_job_id as job_id,
        associate_oid,

        status_value as worker_status,

        original_hire_date as hired_at,
        rehire_date as rehired_at,
        retirement_date as retired_at,
        termination_date as terminated_at,
        custom_last_day_worked_mm_dd_yyyy_ :: date as custom_termination_date

    from source

)

select * from renamed