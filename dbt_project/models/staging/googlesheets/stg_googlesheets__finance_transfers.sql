{%- set cols = ['forecasted_job_id','current_job_id','worker_id','employee_name','transfer_in_date','transfer_out_date','transfer_salary'] -%}

with

source as (

    select * from {{ source('fivetran_google_sheets_finance', 'finance_employee_transfers') }}

),

cleaned as (

    select

        case
            when is_transfer_valid = 'True'
                then true
            else false
        end as is_transfer_valid,
        
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
        {{ dbt_utils.generate_surrogate_key([
            'forecasted_job_id',
            'current_job_id',
            'worker_id',
            'employee_name',
            'transfer_in_date',
            'transfer_out_date',
            'transfer_salary'
        ]) }} as transfer_id,

        forecasted_job_id,
        current_job_id,
        worker_id,
        employee_name,

        is_transfer_valid,

        transfer_in_date::date as transfer_in_date,
        transfer_out_date::date as transfer_out_date,

        transfer_salary::int as transfer_salary

    from cleaned
    where forecasted_job_id is not null
        and current_job_id is not null

)

select * from final