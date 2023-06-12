with source as (

    select * from {{ ref('subscription_transactions_typed') }}

),

windows as (

    select 

        *, 
        
        min(date_month) over (partition by customer_id) as customer_first_month,
        
        datediff(month,
            min(date_month) over (partition by customer_id),
            date_month
            ) as customer_month,
        
        first_value(revenue) over (
            partition by customer_id 
            order by date_month 
            rows between unbounded preceding and unbounded following
            ) as customer_starting_revenue

    from source

),

cleaned_up as (

    select

        id,
        customer_id,
        customer_id_type,
        customer_name,
        category,
        date_month::date as date_month,
        revenue,
        sales_motion,
        rev_rec_date::date as rev_rec_date,
        active_customer,
        prior_revenue,
        revenue_change,
        change_category,
        renewal_amount,
        customer_first_month,
        customer_month,
        customer_starting_revenue

    from windows
    where date_month <= date_trunc('month', current_date)

)

select * from cleaned_up
