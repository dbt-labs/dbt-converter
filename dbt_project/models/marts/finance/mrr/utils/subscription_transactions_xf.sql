with transactions as (

    select * from {{ref('subscription_transactions_filled')}}

),

final as (

    select

        *,

        case when revenue > 0 then 1 else 0 end as active_customer,

        case
        when first_value(case when revenue > 0 then date_month end) over (
                partition by customer_id
                order by date_month
                rows between unbounded preceding and unbounded following
            ) = date_month
            then 1
        else 0
        end as first_month,

        case
        when last_value(case when revenue > 0 then date_month end) over (
                partition by customer_id
                order by date_month
                rows between unbounded preceding and unbounded following
            ) = date_month
            and date_month <= date_trunc('month', current_date)
            then 1
        else 0
        end as last_month

    from transactions

)

select * from final
