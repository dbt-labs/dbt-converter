with transactions as (

    select * from {{ref('subscription_transactions_xf')}}

),

churn_records as (

    select

        customer_id,
        customer_id_type,
        customer_name,
        category,
        dateadd(month, 1, date_month) as date_month,
        0::float as revenue,
        sales_motion,
        dateadd(month, 1, rev_rec_date) as rev_rec_date,
        0::int as active_customer,
        0::int as first_month,
        0::int as last_month

    from transactions

    where last_month = 1

)

select * from churn_records
