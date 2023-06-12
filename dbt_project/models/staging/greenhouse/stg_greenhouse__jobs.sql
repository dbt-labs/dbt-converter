with

jobs as (

    select * from {{ source('greenhouse', 'job') }}
    where _fivetran_deleted = false
        and is_template = false

),

augmented as (

        select 

        *,

        custom_salary_range:min_value::int as minimum_salary,
        custom_salary_range:max_value::int as maximum_salary,
        custom_salary_range:unit::string as salary_currency,
        
        custom_equity_stake_in_shares:min_value::int as min_equity_shares,
        custom_equity_stake_in_shares:max_value::int as max_equity_shares,

        left(custom_job_code,charindex(char(9),custom_job_code)-1) as job_function_code

    from jobs

)

select * from augmented