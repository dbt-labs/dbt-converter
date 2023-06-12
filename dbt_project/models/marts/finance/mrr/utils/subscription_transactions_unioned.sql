with filled as (

    select * from {{ref('subscription_transactions_xf')}}

),

churn as (

    select * from {{ref('subscription_transactions_final_churn')}}

),

unioned as (

    select * from filled
    union all
    select * from churn

),

with_id as (

    select


        -- had to add id_type as there was a quickbooks_customer_id that visually matched
        -- an existing stripe_customer_id, but the actual RECORD for the quickbooks_customer_id
        -- had nulls for the literal `stripe_customer_id` OR `salesforce_account_id` fields. 
        -- That quickbooks customer id then made it to the final CTE of fct_invoice_line_items 
        -- and, before we began identifying the source of (dbt) customer_ids, the quickbooks id
        -- matched the stripe id and blurred together
        -- In short, a human could spot it, but the code didn't know better. 
        
        -- Now it might be more ideal to make sure the connective tissue between data sources
        -- exists. 

        -- easiest to see via this query:
        -- select * from fct_invoice_line_items
        -- where customer_id = 'cus_JQgmBWahhZy2VI' 

        {{dbt_utils.generate_surrogate_key(['customer_id', 'customer_id_type', 'date_month'])}} as id,
        *

    from unioned

)

select * from with_id
