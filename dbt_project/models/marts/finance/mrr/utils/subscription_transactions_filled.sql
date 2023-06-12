with transactions as (

    select * from {{ref('subscription_transactions')}}

),

months as (

    select * from {{ref('all_months')}}

),

customer_dates as (

    select
        customer_id,
        customer_id_type,
        customer_name,
        category,
        min(date_month) as first_transaction_month,
        max(date_month) as last_transaction_month
    from transactions
    {{ dbt_utils.group_by(4) }}

),

customer_months as (

    select

        customer_dates.customer_id,
        customer_dates.customer_id_type,
        customer_dates.customer_name,
        customer_dates.category,
        months.date_month

    from customer_dates

    left outer join months
        on customer_dates.first_transaction_month <= months.date_month
        and customer_dates.last_transaction_month >= months.date_month

),

joined as (

    select

        customer_months.customer_id,
        customer_months.customer_id_type,
        customer_months.customer_name,
        customer_months.category,
        customer_months.date_month,

        coalesce(transactions.revenue, 0) as revenue,
        transactions.sales_motion,
        transactions.rev_rec_date

    from customer_months

    left outer join transactions
        on customer_months.customer_id = transactions.customer_id
        and customer_months.customer_id_type = transactions.customer_id_type
        and customer_months.date_month = transactions.date_month

)

select * from joined