with

source as (

    select * from raw.fivetran_google_sheets_finance.finance_employee_transfers

),

cleaned as (

    select

        case
            when is_transfer_valid = 'True'
                then true
            else false
        end as is_transfer_valid,
        
        
            case
                when forecasted_job_id = 'nan'
                    then null
                else forecasted_job_id
            end as forecasted_job_id,
        
            case
                when current_job_id = 'nan'
                    then null
                else current_job_id
            end as current_job_id,
        
            case
                when worker_id = 'nan'
                    then null
                else worker_id
            end as worker_id,
        
            case
                when employee_name = 'nan'
                    then null
                else employee_name
            end as employee_name,
        
            case
                when transfer_in_date = 'nan'
                    then null
                else transfer_in_date
            end as transfer_in_date,
        
            case
                when transfer_out_date = 'nan'
                    then null
                else transfer_out_date
            end as transfer_out_date,
        
            case
                when transfer_salary = 'nan'
                    then null
                else transfer_salary
            end as transfer_salary
        
    
    from source

),

final as (

    select
        md5(cast(coalesce(cast(forecasted_job_id as TEXT), '') || '-' || coalesce(cast(current_job_id as TEXT), '') || '-' || coalesce(cast(worker_id as TEXT), '') || '-' || coalesce(cast(employee_name as TEXT), '') || '-' || coalesce(cast(transfer_in_date as TEXT), '') || '-' || coalesce(cast(transfer_out_date as TEXT), '') || '-' || coalesce(cast(transfer_salary as TEXT), '') as TEXT)) as transfer_id,

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