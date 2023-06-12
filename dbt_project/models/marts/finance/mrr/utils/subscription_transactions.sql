with transactions as (

    select * from {{ref('transactions__amortized')}}

),

aggregated as (

    select distinct

        -- had to add id_type as there was a quickbooks_customer_id that visually matched
        -- an existing stripe_customer_id, but the actual RECORD for the quickbooks_customer_id
        -- had nulls for the literal `stripe_customer_id` OR `salesforce_account_id` fields
        -- That quickbooks customer id then made it to the final CTE of fct_invoice_line_items 
        -- and, before we began identifying the source of (dbt) customer_ids, the quickbooks id
        -- matched the stripe id and blurred together       
        -- In short, a human could spot it, but the code didn't know better. 
        
        -- Now it might be more ideal to make sure the connective tissue between data sources
        -- exists. 

        -- easiest to see via this query:
        -- select * from fct_invoice_line_items
        -- where customer_id = 'cus_JQgmBWahhZy2VI' 

        {{ dbt_utils.generate_surrogate_key(['date_month','customer_id','customer_id_type']) }} as id,
        date_month,
        customer_id,
        customer_id_type,
        last_value(customer_name) over (partition by customer_id order by date_month) as customer_name,
        category,
        min(start_date) over (partition by date_month, customer_id) as start_date,
        max(end_date) over (partition by date_month, customer_id) as end_date,
        sum(revenue) over (partition by date_month, customer_id) as revenue,

        /*
            This logic is primarily used for dbt Cloud self-service subscriptions.
            If an account upgrades in the middle of a subscription period, they will
            be charged immediately for the upgrade. We do not want this mid-period
            charge to impact the revenue recognition date, as the account will still
            be charged on their next regularly scheduled subscription renewal date.

            Here, we prefer taking the minimum rev_rec date for the given date_month
            which is *not* an upgrade. If the only transaction for the customer in the
            current month is an upgrade (eg. if they did not yet hit their subscription
            date in the current month yet), then fall back to using the stated end_date
            for their active subscription instead.
        */
        coalesce(
            min(case when not is_upgrade then rev_rec_date end) over (partition by date_month, customer_id),
            max(end_date) over (partition by date_month, customer_id)
        ) as rev_rec_date,

        last_value(sales_motion) over (
            partition by date_month, customer_id
            order by end_date, rev_rec_date
            rows between unbounded preceding and unbounded following
        ) as sales_motion

    from transactions

)

select * from aggregated
