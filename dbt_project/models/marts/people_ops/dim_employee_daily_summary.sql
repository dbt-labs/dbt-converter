with

all_days as (

    select * from {{ ref('all_days') }}
    where date_day >= '2023-02-01' and date_day <= CURRENT_DATE()

),

workers as (

    select * from {{ ref('stg_adp__workers') }}

),

work_assignments as (

    select * from {{ ref('stg_adp__work_assignment_history') }}

),

person as (

    select * from {{ ref('stg_adp__person_history') }}

),

reports_to as (

    select * from {{ ref('int_adp_worker_reports_to_name') }}

),

work_email as (

    select * from {{ ref('stg_adp__business_communications') }}

),

worker_departments as (

    select * from {{ ref('int_organizational_units_with_workers') }}
    where organizational_level_name = 'Department'

),

daily_roster as (

    select
        -- ids
        all_days.date_day,
        workers.worker_id,
        work_assignments.worker_assignment_id,

        -- dimensions
        person.preferred_first_name,
        person.preferred_last_name,
        person.preferred_last_name || ', ' || person.preferred_first_name as preferred_full_name,
        reports_to.reports_to_preferred_first_name,
        reports_to.reports_to_preferred_last_name,
        reports_to.reports_to_preferred_last_name || ', ' || reports_to.reports_to_preferred_first_name as reports_to_preferred_full_name,
        work_assignments.job_title,
        work_assignments.assignment_status as employee_status,
        person.legal_address_country_code,
        person.legal_address_country_subdivision_level_1 as legal_address_state_territory,
        work_assignments.is_management_position,
        case
    	    when work_assignments.is_management_position = True then 'Manager'
            else 'Individual Contributor'
        end as management_position,
        work_email.work_email,
        worker_departments.organizational_unit_name as department_name,
        worker_departments.cost_center_code,

        -- measures
        case
            when work_assignments.assignment_status = 'Active' then 1
            else 0
        end as headcount,


        -- dates / times
        coalesce(to_date(workers.rehired_at), to_date(workers.hired_at)) as hired_at,
        workers.terminated_at,

        -- metadata
        case
            when date_day = CURRENT_DATE() then True
            else False 
        end as is_most_recent_record

    from all_days
    cross join workers
    inner join person
    on workers.worker_id = person.worker_id
    inner join work_assignments
    on workers.worker_id = work_assignments.worker_id
    and work_assignments.assignment_valid_from <= all_days.date_day
    and work_assignments.assignment_valid_to > all_days.date_day
    left outer join work_email
    on workers.worker_id = work_email.worker_id
    left outer join worker_departments
    on work_assignments.worker_id = worker_departments.worker_id
    and work_assignments.worker_assignment_id = worker_departments.worker_assignment_id
    left outer join reports_to
    on work_assignments.worker_id = reports_to.worker_id
    and work_assignments.worker_assignment_id = reports_to.worker_assignment_id
    and reports_to.reports_to_valid_from <= all_days.date_day
    and reports_to.reports_to_valid_to > all_days.date_day
    
)

select * from daily_roster