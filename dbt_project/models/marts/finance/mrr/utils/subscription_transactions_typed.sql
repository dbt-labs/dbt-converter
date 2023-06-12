with transactions as (

    select * from {{ref('subscription_transactions_unioned')}}

),

transactions_with_changes as (

    select

        *,

        coalesce(lag(revenue)
            over (partition by customer_id order by date_month), 0)
            as prior_revenue,

        revenue - coalesce(
            lag(revenue) over
                (partition by customer_id order by date_month),
            0) as revenue_change

    from transactions

),

final as (

    select

        *,

        case
            when first_month = 1 and revenue > 0 then 'new'
            when active_customer = 0
                and lag(active_customer)
                over (partition by customer_id order by date_month) = 1
                then 'churn'
            when lag(active_customer)
                over (partition by customer_id order by date_month) = 0
                and active_customer = 1
                then 'reactivation'
            when revenue_change > 0 then 'upgrade'
            when revenue_change < 0 then 'downgrade'
        end as change_category,

        least(revenue, prior_revenue) as renewal_amount

    from transactions_with_changes

)

select * from final
