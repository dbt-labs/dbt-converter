with

source as (

    select * from raw.fivetran_googlesheets.finance_lever_requisition_codes
    where job_id != 'nan'

),

summarized as (

    select 

        job_id,
        
        case
            when is_deactivated = 'True'
                then true
            else false
        end as is_deactivated,

        
            case
                when job_function_code = 'nan'
                    then null
                else job_function_code
            end as job_function_code,
        
            case
                when cost_center = 'nan'
                    then null
                else cost_center
            end as cost_center,
        
            case
                when cost_center_code = 'nan'
                    then null
                else cost_center_code
            end as cost_center_code,
        
            case
                when hiring_country = 'nan'
                    then null
                else hiring_country
            end as hiring_country,
        
            case
                when planned_hire_date = 'nan'
                    then null
                else planned_hire_date
            end as planned_hire_date,
        
            case
                when job_title = 'nan'
                    then null
                else job_title
            end as job_title,
        
            case
                when hiring_manager = 'nan'
                    then null
                else hiring_manager
            end as hiring_manager,
        
            case
                when hiring_manager_email = 'nan'
                    then null
                else hiring_manager_email
            end as hiring_manager_email,
        
            case
                when epd_functional_role = 'nan'
                    then null
                else epd_functional_role
            end as epd_functional_role
        

    from source

),

final as (

    select 
        
        job_id,
        is_deactivated,
        job_function_code,
        cost_center,
        cost_center_code::int as cost_center_code,
        hiring_country,
        to_date(planned_hire_date, 'mm/dd/yyyy hh24:mi:ss TZH:TZM') as planned_hire_date,
        job_title,
        hiring_manager,
        hiring_manager_email,
        epd_functional_role

    from summarized

)

select * from final