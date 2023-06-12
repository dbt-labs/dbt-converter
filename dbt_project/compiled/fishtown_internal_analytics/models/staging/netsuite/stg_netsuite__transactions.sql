with

source as (

    select * from raw.fivetran_netsuite_suiteanalytics.transaction
    where _fivetran_deleted = false
    
),

renamed as (

    select
        -- ids
        id as transaction_id,
        currency as transaction_currency_id,
        postingperiod as posting_accounting_period_id,
        approvalstatus as approval_status_id,
        status as transaction_status_id,   
        entity as entity_id,
        reversal as reversal_transaction_id,
        type as transaction_type_id,
        billingaddress as billing_address_id,
        shippingaddress as shipping_address_id,
        createdby as transaction_created_by_id,
        custbody_cg_je_approved_by::int as je_approved_by_id,
        custbody_cg_je_created_by::int as je_created_by_id,
        custbody_cg_trxcountry::int as trx_country_id,
        custbody_stripe_invoice as stripe_invoice_id,

        -- dimensions
        tranid as transaction_identifier,
        trandisplayname as transaction_identifier_display_name,
        typebaseddocumentnumber as transaction_type_based_document_number,
        memo,
        abbrevtype as transaction_type_short_code,
        recordtype as record_type,
        exchangerate as transaction_currency_exchange_rate,
        accountbasednumber as payment_account_based_number,
        custbody_card_brand as credit_card_brand,
        custbody_itr_nexus as itr_nexus,
        email as contact_email,
        try_to_boolean(intercoadj) as is_intercompany_adjustment,
        try_to_boolean(isreversal) as is_reversal,
        try_to_boolean(paymenthold) as is_payment_hold,
        try_to_boolean(posting) as is_posting,
        try_to_boolean(custbody_adjustment_journal) as is_adjustment_journal,
        try_to_boolean(custbody_cash_register) as is_cash_register,
        
        -- measures
        foreigntotal as foreign_currency_total_amount,
        foreignamountpaid as foreign_currency_amount_paid,
        foreignamountunpaid as foreign_currency_amount_unpaid,
        foreignpaymentamountunused as foreign_currency_amount_unused,
        foreignpaymentamountused as foreign_currency_amount_used,
        custbody_stc_amount_after_discount as amount_after_discount,
        custbody_stc_tax_after_discount as tax_after_discount,
        custbody_stc_total_after_discount as total_after_discount,

        -- date / times
        to_date(trandate) as transaction_date, 
        to_date(closedate) as close_date, 
        to_date(reversaldate) as reversal_date,
        lastmodifieddate as last_modified_at,
        createddate as created_at,
        to_date(createddate) as created_date, 

        --- metadata
        _fivetran_synced  

    from source

)

select * from renamed