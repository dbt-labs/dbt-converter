with

credit_note_items as (

    select * from {{ ref('stg_salesforce__credit_note_items') }}

), 

credit_notes as (

    select * from {{ ref('int__salesforce_credit_notes') }}

),

products as (

    select * from {{ ref('stg_salesforce__products') }}

), 

enriched as (

    select
        credit_note_items.sfdc_credit_note_item_id,
        credit_note_items.sfdc_credit_note_id,
        credit_notes.sfdc_account_id,
        credit_notes.credit_note_name,
        credit_notes.account_name,
        products.product_name,
        products.product_type,
        products.product_family,
        products.credit_note_credit,
        products.credit_note_debit,
        products.invoice_credit,
        products.invoice_debit,
        products.payment_credit,
        products.payment_debit,
        products.refund_credit,
        products.refund_debit,
        products.rev_rec_credit,
        products.rev_rec_debit
        
    from credit_note_items
    left join credit_notes
        on credit_note_items.sfdc_credit_note_id = credit_notes.sfdc_credit_note_id
    left join products
        on credit_note_items.sfdc_product_id = products.product_id

)

select * from enriched