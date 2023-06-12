with 

planned_sales_attributes as (

    select * from {{ ref('stg_googlesheets__planned_sales_attributes') }}

),

employees as (

    select * from {{ ref('dim_employee_roster') }}
    where employee_rank = 1

),

pigment_codes as (

    select * from {{ ref('stg_googlesheets__finance_job_ids') }}
    where is_deactivated = false

),

transfers as (

    select *
    from {{ ref('int__employee_transfers') }}
    where worker_id is not null

),

comp_bands as (

    select * from {{ ref('stg_googlesheets__global_comp_bands') }}
    where band_rank = 1
        and fiscal_effective_period = 'FY24'

),

openings as (
    
    select * from {{ ref('fct_greenhouse_job_openings') }}
    where job_id_error = false
        and job_opening_status = 'open'
        and job_status = 'open'

),

offers as (

    select * from {{ ref('fct_greenhouse_job_offers') }}
    where job_id_error = false
        and offer_status = 'accepted'
        and offer_rank = 1
        and application_source != 'Internal Applicant'

),


transfer_augment as (

    select 
        pigment_codes.*,
        transfers.worker_id,
        transfers.transfer_in_date,
        transfers_inverse.transfer_in_date - 1 as transfer_out_date,
        transfers.transfer_hire_date,
        transfers.employee_name,
        transfers.prior_salary,
        transfers.transfer_salary,

        case
            when pigment_codes.job_id = transfers.forecasted_job_id
                then 'transfer_in'
            when pigment_codes.job_id = transfers_inverse.current_job_id 
                then 'transfer_out'
            else 'static'
        end as transfer_logic

    from pigment_codes 
    
    left join transfers
        on pigment_codes.job_id = transfers.forecasted_job_id

    left join transfers as transfers_inverse
        on pigment_codes.job_id = transfers_inverse.current_job_id

),

synth as (

    select
        -- ids
        transfer_augment.job_id,

        case
            when transfer_logic = 'transfer_in'
                then transfer_augment.worker_id
            else employees.worker_id
        end as worker_id,
        
        employees.worker_assignment_id,
        employees.associate_id,
        transfer_augment.job_function_code as planned_job_function_code,
        openings.job_function_code as opening_job_function_code,
        offers.job_function_code as offer_accepted_job_function_code,
        'TODO' as adp_job_function_code,


        -- dates
        openings.opened_date as opening_create_date,
        offers.created_date as offer_create_date,
        
        case
            when employees.is_active_employee = true
                then null
            else transfer_augment.transfer_in_date
        end as transfer_in_date,

        case
            when employees.is_active_employee = true
                then null
            else transfer_augment.transfer_out_date
        end as transfer_out_date,


        transfer_augment.planned_hire_date :: date as plan_hire_date,
        offers.start_date as offer_hire_date,
        employees.hire_date as adp_hire_date,
        transfer_augment.transfer_hire_date,
        coalesce(
            adp_hire_date,
            transfer_hire_date,
            offer_hire_date,
            plan_hire_date
        ) as final_hire_date,

        coalesce(employees.job_start_date, final_hire_date) as job_start_date,

        backfills.last_working_date as adp_termination_date,
        backfills.termination_date as adp_custom_termination_date,
        backfills.official_termination_date as termination_date,

        case
            when backfills.official_termination_date > '9000-01-01'
                then backfills.official_termination_date
            else dateadd('day',1,backfills.official_termination_date)
        end as finance_termination_date,


        -- employee status
        case
            when employees.is_active_employee = true
                then 'Existing'
            else 'TBH'
        end as job_id_status,

        case
            when employees.is_active_employee = true
                then 'Hired'
            when transfer_augment.transfer_logic = 'transfer_in'
                then 'Incoming Transfer'
            when offers.offer_status = 'accepted'
                then 'Offer Accepted'
            when openings.job_opening_status = 'open'
                then 'Req Open in ATS'
            else 'Not in ATS'
        end as ats_status,

        case
            when job_id_status = 'TBH'
            and ats_status in ('Not in ATS')
                then true
            else false
        end as is_overwrite_eligible,

        employees.is_active_employee,
        coalesce(job_id_status = 'Existing',false) as is_existing_job_id_status,

        backfills.employment_status as backfill_logic,
        backfills.worker_id as backfill_employee,


        -- names
        transfer_augment.job_title as plan_job_title,
        openings.job_name as opening_job_title,
        offers.job_name as offer_job_title,
        employees.job_title as adp_job_title,

        coalesce(
            adp_job_title,
            offer_job_title,
            opening_job_title,
            plan_job_title
        ) as job_title,

        case
            when employees.is_active_employee = true
                then null
            else offers.candidate_name
        end as offer_accepted_name,

        transfer_augment.employee_name as transfer_employee_name,
        employees.preferred_name as adp_employee_name,

        coalesce(
            adp_employee_name,
            offer_accepted_name,
            transfer_employee_name
        ) as employee_name,

        transfer_augment.hiring_manager_email as plan_hiring_manager,
        openings.hiring_manager_email as opening_hiring_manager,
        offers.hiring_manager_email as offer_accepted_hiring_manager,
        employees.reports_to_email as adp_hiring_manager,

        coalesce(
            adp_hiring_manager,
            offer_accepted_hiring_manager,
            opening_hiring_manager,
            plan_hiring_manager
        ) as hiring_manager,


        -- hiring location
        planned_salaries.country as plan_salary_country,

        transfer_augment.hiring_country as plan_hiring_country,
        openings.location_country as opening_hiring_country, -- TODO: Build Pigment 'Unmapped' test
        offers.location_country as offer_accepted_hiring_country,
        employees.legal_address_country_name as adp_hiring_country,

        coalesce(
            adp_hiring_country,
            offer_accepted_hiring_country,
            nullif(
                opening_hiring_country,
                'Unmapped'
            ),
            plan_hiring_country
        ) as hiring_country,


        -- cost center/team
        openings.l0_department_name as opening_cost_center_name,
        offers.l0_department_name as offer_cost_center_name,
        employees.cost_center_name as adp_cost_center_name,

        transfer_augment.cost_center_code as plan_cost_center_code,
        'TODO' as opening_cost_center_code,
        'TODO' as offer_accepted_cost_center_code,
        employees.cost_center_code as adp_cost_center_code,
        coalesce(adp_cost_center_code, plan_cost_center_code) :: integer as cost_center_code, -- TODO: Add in GH


        -- data source salaries
        openings.minimum_salary as opening_minimum_salary,
        openings.midpoint_salary as opening_midpoint_salary,
        openings.maximum_salary as opening_maximum_salary,


        -- implied salaries
        planned_salaries.minimum_salary as plan_salaries_min_salary,
        planned_salaries.midpoint_salary as plan_salaries_mid_salary,
        planned_salaries.maximum_salary as plan_salaries_max_salary,

        opening_salaries.minimum_salary as opening_salaries_min_salary,
        opening_salaries.midpoint_salary as opening_salaries_mid_salary,
        opening_salaries.maximum_salary as opening_salaries_max_salary,


        -- actual salaries
        transfer_augment.transfer_salary,
        offers.salary as offer_accepted_salary,
        employees.adp_salary,

        coalesce(
            employees.adp_salary,
            offer_accepted_salary,
            transfer_augment.transfer_salary
        ) as employee_salary,


        -- currency dimensions
        openings.salary_currency as opening_currency,
        offers.salary_currency as offer_accepted_currency,
        employees.adp_currency,


        -- other attributes
        transfer_augment.epd_functional_role,


        -- sales attributes
        employees.salesforce_job_requisition_id,

        case
            when is_existing_job_id_status = true
                then employees.sfdc_role_name
            else planned_sales_attributes.sales_functional_role
        end as sfdc_role_name,

        case
            when is_existing_job_id_status = true
                then employees.sales_region
            else planned_sales_attributes.sales_l_0_region
        end as sales_region,

        case
            when is_existing_job_id_status = true
                then employees.detail_sales_region
            else planned_sales_attributes.sales_l_1_region
        end as detail_sales_region,

        case
            when is_existing_job_id_status = true
                then employees.sale_market_segment
            else planned_sales_attributes.sales_segment
        end as sale_market_segment,

        case
            when is_existing_job_id_status = true
                then employees.sales_minor_level
            else planned_sales_attributes.sales_minor_level
        end as sales_minor_level
        
    from transfer_augment

    left join employees
        on transfer_augment.job_id = employees.job_id
        and transfer_augment.transfer_logic in ('transfer_in','static')
        and is_active_employee = true

    left join employees as backfills
        on transfer_augment.job_id = backfills.job_id
        and backfills.is_active_employee = false
    
    left join openings
        on transfer_augment.job_id = openings.finance_job_id
        and openings.opened_month > coalesce(backfills.final_termination_month,'1990-01-01')
    
    left join offers
        on transfer_augment.job_id = offers.finance_job_id
        and offers.start_month > coalesce(backfills.final_termination_month,'1990-01-01')

    left join comp_bands as planned_salaries 
        on transfer_augment.job_function_code = planned_salaries.job_function_code
        and lower(transfer_augment.hiring_country) = lower(planned_salaries.country)
    
    left join comp_bands as opening_salaries
        on openings.job_function_code = opening_salaries.job_function_code
        and lower(openings.location_country) = lower(opening_salaries.country)

    left join planned_sales_attributes 
        on transfer_augment.job_id = planned_sales_attributes.job_id

)

select * from synth