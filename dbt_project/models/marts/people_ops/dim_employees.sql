with

workers as (

    select * from {{ ref('stg_adp__workers') }}

),

worker_timeseries as (

    select * from {{ ref('int_adp_worker_timeseries') }}

),

person_history as (

    select * from {{ ref('int_adp_person_history') }}

),

business_communications as (

    select * from {{ ref('stg_adp__business_communications') }}

),

worker_departments as (

    select * from {{ ref('int_organizational_units_with_workers') }}
    where organizational_level_name = 'Department'

),

department_classifications as (

    select * from {{ ref('stg_googlesheets__technical_classification_by_adp_department_code') }}

),

worker_business_entities as (

    select * from {{ ref('int_organizational_units_with_workers') }}
    where organizational_level_name = 'Business Unit'

),

worker_locations as (

    select * from {{ ref('int_adp_workers_with_locations') }}

),

final as (

    select
        workers.worker_id,
        workers.associate_oid,
        workers.job_id,
        worker_timeseries.worker_assignment_id,
        worker_timeseries.position_id,
        worker_timeseries.reports_to_worker_id,
        worker_departments.organizational_unit_id as department_unit_id,
        worker_business_entities.organizational_unit_id as business_entity_id,
        worker_departments.cost_center_code,
        
        person_history.preferred_first_name,
        person_history.preferred_last_name,
        person_history.preferred_name,
        business_communications.work_email,
        workers.worker_status,

        worker_timeseries.job_acronym,
        worker_timeseries.job_title,
        worker_timeseries.is_management_position,
        worker_timeseries.is_worker_outside_of_usa,

        reports_to_names.preferred_name as reports_to_name,
        reports_to_email.work_email as reports_to_email,
        worker_departments.organizational_unit_name as department_name,
        department_classifications.org,
        department_classifications.technical_classification,
        worker_business_entities.organizational_unit_name as business_entity_name,

        person_history.legal_address_country_code,
        person_history.legal_address_country_name,
        person_history.legal_address_postal_code,
        worker_locations.address_country_code,
        worker_locations.address_country_name,

        case
            when worker_timeseries.valid_from = min(worker_timeseries.valid_from) over (partition by workers.worker_id)
                then true
            else false
        end as is_first_employee_record,
        case
            when worker_timeseries.valid_to is null
                then true
            else false
        end as is_most_recent_employee_record,

        workers.hired_at,
        workers.rehired_at,
        coalesce(workers.rehired_at, workers.hired_at) as final_hire_date,
        min(worker_timeseries.valid_from) over(partition by workers.worker_id, worker_timeseries.job_title) as job_start_date,
        workers.retired_at,
        workers.terminated_at as last_working_date,
        workers.custom_termination_date as termination_date,
        coalesce(termination_date, last_working_date) as official_termination_date,

        worker_timeseries.valid_from,
        worker_timeseries.valid_to

    from workers
    left join worker_timeseries
        on workers.worker_id = worker_timeseries.worker_id
    left join person_history
        on workers.worker_id = person_history.worker_id
    left join business_communications
        on workers.worker_id = business_communications.worker_id
    left join business_communications as reports_to_email
        on worker_timeseries.reports_to_worker_id = reports_to_email.worker_id
    left join person_history as reports_to_names
        on worker_timeseries.reports_to_worker_id = reports_to_names.worker_id
    left join worker_departments
        on worker_timeseries.worker_assignment_id = worker_departments.worker_assignment_id
    left join department_classifications
        on worker_departments.cost_center_code = department_classifications.cost_center_code
    left join worker_business_entities
        on worker_timeseries.worker_assignment_id = worker_business_entities.worker_assignment_id
    left join worker_locations
        on worker_timeseries.worker_assignment_id = worker_locations.worker_assignment_id

)

select * from final