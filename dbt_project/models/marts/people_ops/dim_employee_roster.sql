with 

planned_headcount as (

    select * from {{ ref('stg_googlesheets__finance_job_ids') }}

),


sfdc_attributes as (

    select * from {{ ref('stg_salesforce__job_requisitions') }}

),

transfers as (

    select * from {{ ref('stg_googlesheets__finance_transfers') }}
    where is_transfer_valid = true

),

employee_salaries as (

    select * from {{ ref('int_adp_worker_base_remuneration') }}
    where is_current_annual_amount = true

),

employees_stg as (

    select * from {{ ref('dim_employees') }}
    where is_most_recent_employee_record = true

),

employees as (

    select

        employees_stg.*,
        employee_salaries.annual_amount as adp_salary,
        employee_salaries.currency as adp_currency

    from employees_stg
    left join employee_salaries
        on employees_stg.worker_assignment_id = employee_salaries.worker_assignment_id
        and employees_stg.worker_id = employee_salaries.worker_id

),


final as (
    
    select 
        -- ids
        employees.worker_id,
        employees.job_id,
        employees.worker_assignment_id,
        employees.associate_oid as associate_id,

        -- dates
        employees.final_hire_date as hire_date,
        employees.job_start_date,
        employees.last_working_date,
        employees.termination_date,
        employees.official_termination_date,
        coalesce(date_trunc('month',employees.official_termination_date),'1990-01-01') as final_termination_month,
        coalesce(date_trunc('month',employees.official_termination_date),'3000-01-01') as employee_rank_termination_month,
        
        transfers.transfer_out_date,

        -- other        
        case
            when transfers.is_transfer_valid = true
                then 'Known Transfer'
            when employees.official_termination_date is null 
                then 'Active'
            when date_trunc('month',employees.official_termination_date) = date_trunc('month',current_date)
                then 'Recent Termination'
            when employees.official_termination_date > current_date
                then 'Future Termination'
            else 'Terminated'
        end as employment_status,

        coalesce(employment_status = 'Active',false) as is_active_employee,

        employees.job_title,
        employees.preferred_name,
        employees.work_email as employee_email,
        employees.reports_to_name,
        employees.reports_to_email,
        employees.legal_address_country_name,
        employees.department_name as cost_center_name,
        employees.cost_center_code,
        employees.adp_salary,
        employees.adp_currency,
        transfers.forecasted_job_id as transfer_into_job_id,

        -- planned attributes
        planned_headcount.epd_functional_role,

        -- sfdc attributes
        sfdc_attributes.role_name as sfdc_role_name,
        sfdc_attributes.salesforce_job_requisition_id,
        sfdc_attributes.sales_region,
        sfdc_attributes.detail_sales_region,
        sfdc_attributes.market_segment as sale_market_segment,
        sfdc_attributes.minor_level as sales_minor_level,

        -- other flags
        row_number() over(partition by employees.job_id order by employee_rank_termination_month desc) as employee_rank

    from employees

    left join transfers 
        on employees.job_id = current_job_id

    left join sfdc_attributes
        on employees.job_id = sfdc_attributes.adp_job_id

    left join planned_headcount
        on employees.job_id = planned_headcount.job_id

)

select * from final