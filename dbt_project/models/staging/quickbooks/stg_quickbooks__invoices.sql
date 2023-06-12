with

lines as (

    select * from {{ref('stg_quickbooks__invoice_lines')}}

),

invoices as (

    select 
        invoice_id,
        quickbooks_customer_id,
        original_quickbooks_customer_id,
        stripe_customer_id,
        salesforce_account_id,
        internal_id,
        quickbooks_account,
        quickbooks_customer_name,
        total_amt,
        txn_date,
        due_date,
        balance,
        delivery_type,
        delivery_time,
        email_status,
        doc_number,
        created_at,
        updated_at,
        lines,
        is_open_invoice,
        
        count(*) as total_line_items,
        sum(case when is_sales_tax_line_item = TRUE then 1 else 0 end) as total_tax_line_items,
        sum(case when is_sales_tax_line_item = FALSE then 1 else 0 end) as total_charge_line_items,
        sum(case when is_professional_services_item = TRUE then 1 else 0 end) as total_professional_services_line_items

    from lines 
    {{ dbt_utils.group_by(n=20) }} 

),

enriched as (

    select
        *,

        total_professional_services_line_items > 0 as has_professional_services_charges,
        total_charge_line_items = total_professional_services_line_items as is_only_professional_services_charges,

        total_amt - balance as amount_paid,

        balance < .05 * total_amt as is_paid,

        is_paid and due_date < current_date as is_overdue

    from invoices
    where not is_open_invoice

)

select * from enriched
