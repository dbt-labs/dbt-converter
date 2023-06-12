with

invoices as (

    select * from {{ ref('fct_stripe_invoices') }}

),

sales_tax_adjustments as (
--This was a Sales Tax adjustment where someone's invoice
--amount says 106 bc it was the original invoiced total,
--but they're actually being charged for sales tax (6 cents)
    select
        stripe_customer_id
    from invoices
    where invoice_id = 'in_1I70KmKS6Y3lIrasRhjC0zuX'
    and subscription_revenue != 0
    and subscription_prorations != 0
    and invoice_subtotal != 0
    and invoice_sales_tax = 6

),

pre_sub_items_invoice as (

--This invoice didn't have any subscription items attached
--bc it was circa 4/2018. Testing to ensure we're always
--calculating historic invoices correctly.
    select
        stripe_customer_id
    from invoices
    where invoice_id = 'in_1CE5yhKS6Y3lIrasDAOdQsdm'
    and subscription_revenue != 100
    and subscription_prorations != 0
    and invoice_subtotal != 100

),

refund_with_tax as (
--refund of someone with a partial refund
--where we had to calculate the refund tax
    select
        stripe_customer_id
    from invoices
    where invoice_id = 'in_1KTF1AKS6Y3lIrasbykov8Tt'
    and subscription_revenue != 50
    and subscription_prorations != 0
    and invoice_subtotal != 50
    and refund_total != 54.44
    and refund_sales_tax != 4.44

),

refunded_tax as (
--this is an example of someone being refunded just
--the sales tax. so the refund subtotal should always be
--0 since we subtract the invoiced sales tax from invoice_subtotal
    select
        stripe_customer_id
    from invoices
    where invoice_id = 'in_1I4tPdKS6Y3lIrasFDXOk70C'
    and subscription_revenue != 400
    and subscription_prorations != 0
    and invoice_subtotal != 400
    and invoice_sales_tax != 34
    and refund_subtotal != 0

),

full_refund as (
--this is an example of someone being refunded just
--the sales tax. so the refund subtotal should always be
--0 since we subtract the invoiced sales tax from invoice_subtotal
    select
        stripe_customer_id
    from invoices
    where invoice_id = 'in_1J0X7fKS6Y3lIrasCV2fuLNp'
    and invoice_total != 54.37
    and refund_total != 54.37
    and invoice_subtotal != 0

),

unioned as (

    select * from sales_tax_adjustments
        union all
    select * from pre_sub_items_invoice
        union all
    select * from refund_with_tax
        union all
    select * from full_refund

)

select * from unioned