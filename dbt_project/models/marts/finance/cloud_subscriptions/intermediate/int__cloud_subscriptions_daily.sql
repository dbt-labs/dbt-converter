with

amortized as (

    select * from {{ ref('int__cloud_subscriptions_amortized') }}

),

transactions as (

    select * from {{ ref('fct_cloud_transactions') }}

),

r3 as (

    select
        customer_id,
        sales_motion,
        invoice_date::date as date_day,
        sum(revenue_run_rate) as revenue_run_rate
    from transactions
    where not is_subscription_charge
    group by 1,2,3

),


with_r3 as (

    select
        amortized.*,
        coalesce(
            r3.revenue_run_rate,
            0
        ) as revenue_run_rate

    from amortized
    left join r3
        on amortized.date_day = r3.date_day
        and amortized.customer_id = r3.customer_id
        and amortized.sales_motion = r3.sales_motion

),

with_booleans as (

    select
        *,
        arr > 0 as is_customer_active,

        row_number() over (
            partition by customer_id
            order by date_day
        ) = 1 as is_customer_first_day,

        case
            when row_number() over (
                    partition by customer_id
                    order by date_day desc) = 1
                or  datediff(
                        day,
                        date_day,
                        lead(date_day) over (
                            partition by customer_id
                            order by date_day)
                    ) > 1
                then true
            else false
        end as is_customer_last_day

    from with_r3

)

 select * from with_booleans