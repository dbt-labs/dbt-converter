with

filled as (

    select * from {{ref('int__cloud_subscriptions_daily')}}

),

churn as (

    select * from {{ref('int__cloud_subscriptions_daily_churned')}}

),

unioned as (
--We want to keep this as `union all` over using the union macro
--bc we want to be flagged when we add a new column in the daily model
--and forget to add it to the churn model.
    select * from filled
    union all
    select * from churn

),

with_id as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'date_day',
            'customer_id',
            'sales_motion'
        ])}} as id,

        {{ dbt_utils.star(
            from=ref('int__cloud_subscriptions_daily'),
            except=["ID"]
        ) }}

    from unioned

)

select * from with_id