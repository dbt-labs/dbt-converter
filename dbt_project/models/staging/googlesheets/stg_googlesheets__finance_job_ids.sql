{%- set cols = ['job_function_code','cost_center','cost_center_code','hiring_country','planned_hire_date','job_title','hiring_manager','hiring_manager_email','epd_functional_role'] -%}

with

source as (

    select * from {{source('fivetran_googlesheets', 'finance_lever_requisition_codes')}}
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

        {% for col in cols %}
            case
                when {{ col }} = 'nan'
                    then null
                else {{ col }}
            end as {{ col }} {%- if not loop.last %},{% endif %}
        {% endfor %}

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