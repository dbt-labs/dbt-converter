{# Get the minimum date of metering history to keep table as lean as possible #}
{%- set min_query -%}
    select min(start_time)::date from {{ ref('stg_snowflake__warehouse_metering_history') }}
{%- endset -%}

{%- set min_warehouse_start_time = dbt_utils.get_single_value(
    min_query,
    default = "{{ dateadd('month', -6, 'current_date') }}"
) -%}


with

 contract_rates as (

    select * from {{ ref('snowflake_contract_rates')}}

),

date_spine as (

    select * from {{ ref('all_days') }}
    where date_day >= '{{ min_warehouse_start_time }}'

),

contract_rate_rework as (

    select  
        effective_date as effective_start_date,
        lead(effective_date, 1, '{{ var("future_proof_date") }}') over (
            order by effective_date asc
        ) as next_effective_date,
        {{ dateadd('day', -1, 'next_effective_date') }} as effective_end_date,
        rate

    from contract_rates

),

rate_amortized as (

    select 
        contract_rate_rework.rate,
        date_spine.date_day

    from contract_rate_rework
    left join date_spine 
    on date_spine.date_day >= contract_rate_rework.effective_start_date
        and date_spine.date_day <= contract_rate_rework.effective_end_date

)

select * from rate_amortized