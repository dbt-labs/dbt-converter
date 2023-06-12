with

quickbooks as (

    select * from {{ ref('int__quickbooks_invoice_lines') }}

),

salesforce as (

    select * from {{ ref('int__salesforce_invoice_lines') }}

),

stripe as (

    select * from {{ ref('fct_stripe_invoices') }}

),

cloud_account_mappings as (

    select * from {{ ref('cloud_account_mappings') }}
    where is_primary_cloud_account = true

),

unioned as (

    select
        'salesforce' as source,
        salesforce.invoice_line_id,
        salesforce.invoice_id,
        cloud_account_mappings.stripe_customer_id,
        salesforce.account_id as salesforce_account_id,
        salesforce.quickbooks_customer_id,
        salesforce.sfdc_order_item_id,

        salesforce.account_name as customer_name,
        salesforce.invoice_number,
        salesforce.product_description as description,
        salesforce.product_name,
        salesforce.product_type as transaction_type,

        salesforce.subtotal as amount,
        salesforce.tax_amount,
        salesforce.start_date,
        salesforce.end_date,
        salesforce.invoice_date,
        salesforce.created_at,
        salesforce.billing_finance_period_start_date,

        salesforce.invoice_status,
        salesforce.is_open_invoice,
        salesforce.is_open_invoice as is_paid_invoice,
        salesforce.is_professional_services_item,
        false as is_sales_tax_line_item

    from salesforce
    left join cloud_account_mappings
        on salesforce.account_id = cloud_account_mappings.salesforce_account_id
    where invoice_line_status != 'Cancelled'
      and invoice_status != 'Cancelled'

    union all

    select
        'quickbooks' || ' - ' || quickbooks_account as source,
        quickbooks.invoice_line_id,
        quickbooks.invoice_id,
        cloud_account_mappings.stripe_customer_id,
        quickbooks.salesforce_account_id,
        quickbooks.quickbooks_customer_id,
        null as sfdc_order_item_id,

        quickbooks.quickbooks_customer_name as customer_name,
        quickbooks.doc_number as invoice_number,
        quickbooks.description,
        quickbooks.description as product_name,
        quickbooks.transaction_type,

        quickbooks.amount,
        --quickbooks seems to have separate line items for taxes, so may need to be dealt with differently
        null as tax_amount,
        quickbooks.start_date,
        quickbooks.end_date,
        quickbooks.invoice_date,
        quickbooks.created_at,

        -- billing finance period is a salesforce-defined period and thus does not have joins
        -- to quickbooks invoices. Additionally, as of March 2023 this field is only used in 
        -- revenue recognition flows filtered to salesforce invoices only 
        null as billing_finance_period_start_date,

        -- Leaving invoice_status blank as there is no clear field to use in the source
        -- We could base it on the is_open_invoice field, but currently do not have the
        -- context needed to parse that into separate statuses. Additionally, as of March 2023
        -- this status field is only used in revenue recognition flows filtered to salesforce
        -- invoices only 
        null as invoice_status,
        quickbooks.is_open_invoice,
        quickbooks.is_open_invoice as is_paid_invoice,
        quickbooks.is_professional_services_item,
        quickbooks.is_sales_tax_line_item
    from quickbooks
    left join cloud_account_mappings using (salesforce_account_id)

    union all

    select 
        'stripe' as source,
        invoice_id as invoice_line_id,
        invoice_id,
        stripe_customer_id,
        salesforce_account_id,
        null as quickbooks_customer_id,
        null as sfdc_order_item_id,

        stripe_customer_name as customer_name,
        invoice_number,
        invoice_description as description,
        'self-service subscription' as product_name,
        'self-service' as transaction_type,

        invoice_subtotal as amount,
        invoice_sales_tax as tax_amount,
        invoice_period_start::date as start_date,
        invoice_period_end::date as end_date,
        invoice_date::date as invoice_date,
        invoice_date as created_at,
        -- billing finance period is a salesforce-defined period and thus does not have joins
        -- to stripe invoices. Additionally, as of March 2023 this field is only used in 
        -- revenue recognition flows filtered to salesforce invoices only 
        null as billing_finance_period_start_date,

        invoice_status,
        not is_closed_invoice as is_open_invoice,
        is_paid_invoice,
        false as is_professional_services_item,
        false as is_sales_tax_line_item

    from stripe

),

final as (

    select
        coalesce(
            stripe_customer_id,
            salesforce_account_id,
            quickbooks_customer_id
        ) as customer_id,
        case
            when stripe_customer_id is not null
                then 'stripe_customer_id'
            when salesforce_account_id is not null
                then 'salesforce_account_id'
            when quickbooks_customer_id is not null
                then 'quickbooks_customer_id'
        end as customer_id_type,
        *

    from unioned

)

select * from final