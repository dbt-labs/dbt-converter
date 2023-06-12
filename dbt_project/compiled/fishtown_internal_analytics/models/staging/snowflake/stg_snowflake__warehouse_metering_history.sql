with

source as (

	select * from snowflake.account_usage.warehouse_metering_history
    -- Internal snowflake warehouse we are not charged for
    where warehouse_id != 0

),

final as (

    select
        warehouse_id,
        warehouse_name,

        credits_used,
        start_time,
        end_time,
        date_trunc('day', end_time) as usage_day,
        date_trunc('month', end_time) as usage_month,
        datediff(
        hour,
        start_time,
        end_time
        ) as usage_duration_in_hours
        
    from source

)

select * from final