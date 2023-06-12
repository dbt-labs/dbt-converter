with

customers as (

    select * from {{ref('base__quickbooks_customers')}}

),

sfdc_accounts as (

    select * from {{ref('stg_quickbooks__account_id_map')}}

),

stripe as (

    select * from {{ref('stg_cloud_stripe__customers')}}
    --this is specifically for self-service converted accounts
    --where we would want to have the`stripe_customer_id` as the main
    --customer identifier. This way, we can see all of their historical
    --MRR. This is temporary until we move all cloud accounts to Salesforce CPQ
    --We will use this in the `fct_cloud_invoice_lines` model 
),

joined as (

    select 
        customers.*,
        sfdc_accounts.salesforce_account_id,
        stripe.stripe_customer_id as stripe_customer_id

    from customers
    left join sfdc_accounts
        on customers.quickbooks_customer_id = sfdc_accounts.quickbooks_customer_id
    left join stripe
        on customers.quickbooks_customer_id = stripe.stripe_customer_id

)

select * from joined