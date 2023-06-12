with

warehouse_metering_history as (

    select * from {{ ref('stg_snowflake__warehouse_metering_history') }}

),

contract_rates as (

    select * from {{ ref('int_snowflake_amortized_rates') }}

),

joined as (

    select
        warehouse_metering_history.warehouse_id,
        warehouse_metering_history.warehouse_name,

        contract_rates.rate as usage_rate,
        warehouse_metering_history.credits_used as credits_spent,
        warehouse_metering_history.credits_used * contract_rates.rate as dollars_spent,

        warehouse_metering_history.usage_day,
        warehouse_metering_history.usage_month,
        warehouse_metering_history.usage_duration_in_hours
    
    from warehouse_metering_history
    left join contract_rates
        on warehouse_metering_history.usage_day = contract_rates.date_day

),

final as (

    select
        warehouse_id,
        warehouse_name,

        usage_day,
        usage_month,
        usage_rate,

        sum(dollars_spent) as total_dollars_spent,
        sum(credits_spent) as total_credits_spent,
        sum(usage_duration_in_hours) as total_hours_active

    from joined
    {{ dbt_utils.group_by(5) }}

)

select * from final