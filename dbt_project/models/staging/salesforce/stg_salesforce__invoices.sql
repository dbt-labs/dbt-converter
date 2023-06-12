with

invoices as (

    select * from {{ ref('base__salesforce_invoices') }}

),

accounts as (

    select * from {{ ref('stg_salesforce__accounts') }}

),

quickbooks as (

    select * from {{ ref('stg_quickbooks__customers') }}

),

joined as (

    select
        invoices.*,
        accounts.account_name,
        quickbooks.quickbooks_customer_id,
        quickbooks.stripe_customer_id

    from invoices
    left join accounts
        on invoices.account_id = accounts.account_id
    left join quickbooks
        on invoices.account_id = quickbooks.salesforce_account_id

)

select * from joined