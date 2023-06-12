with

invoice_lines as (

    select * from {{ ref('base__salesforce_invoice_lines') }}

),

invoices as (

    select * from {{ ref('stg_salesforce__invoices') }}

),

products as (

    select * from {{ ref('stg_salesforce__products') }}

),

revenue_finance_periods as (

    select * from {{ ref('stg_salesforce__rev_finance_period') }}

),

joined as (

    select
        invoice_lines.*,
        invoices.billing_contact_id,
        invoices.account_id,
        invoices.quickbooks_customer_id,

        invoices.account_name,
        invoices.invoice_number,
        products.product_type,
        products.product_name,
        products.product_description,
        products.is_professional_services_item,
        invoices.is_open_invoice,
        invoices.invoice_status,

        invoices.invoice_date,
        revenue_finance_periods.period_start_date as billing_finance_period_start_date

    from invoice_lines
    left join invoices
        on invoice_lines.invoice_id = invoices.invoice_id
    left join products
        on invoice_lines.product_id = products.product_id
    left join revenue_finance_periods
        on invoice_lines.sfdc_billing_finance_period_id = revenue_finance_periods.sfdc_rev_finance_period_id

)

select * from joined
where account_id != '0014v00002Id1ZEAAZ'
    --exclude test accounts