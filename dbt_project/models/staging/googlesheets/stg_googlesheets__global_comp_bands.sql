with

source as (

    select * from {{ source('fivetran_googlesheets', 'global_compensation_bands') }}

),

summarized as (

    select 

        {{ dbt_utils.generate_surrogate_key([
            'job_function_code',
            'country',
            'effective_period',
            'version_number'
        ]) }} as comp_band_id,

        job_function_code,
        level,
        initcap(country) as country,
        role_name,
        adp_description,
        "GROUP" as functional_group, 
        sub_group,
        effective_period as fiscal_effective_period,
        currency,
        minimum_salary,
        midpoint_salary,
        maximum_salary,
        version_number,
        updated_at,
        row_number() over (
                partition by job_function_code,country, effective_period
                order by version_number desc
        ) as band_rank

    from source
    where job_function_code is not null
        and level is not null

)

select * from summarized