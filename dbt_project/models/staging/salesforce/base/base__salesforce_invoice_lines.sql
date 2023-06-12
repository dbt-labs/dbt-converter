with

source as (

    select * from {{ source('salesforce', 'invoice_lines') }}
    where not isdeleted

),

renamed as (

    select
        id as invoice_line_id,
        blng__invoice__c as invoice_id,
        createdbyid as created_by_id,
        lastmodifiedbyid as last_modified_by_id,
        blng__uniqueid__c as unique_id,
        blng__product__c as product_id,

        name as invoice_line_item,
        blng__subtotal__c as subtotal,
        blng__taxamount__c as tax_amount,
        blng__totalamount__c as total_amount,
        blng__unitprice__c as unit_price,

        blng__quantity__c as quantity,
        blng__duedate__c as due_date,
        blng__startdate__c as start_date,
        blng__enddate__c as end_date,
        blng__chargetype__c as charge_type,
        blng__chargedate__c as charged_at,

        blng__balancewithoutdebits__c as balance_without_debits,
        blng__balance__c as balance,
        blng__billingfinancebook__c as sfdc_billing_finance_book_id,
        blng__billingfinanceperiod__c as sfdc_billing_finance_period_id,
        blng__billingfrequency__c as billing_frequency,
        blng__billingglrule__c as sfdc_billing_gl_rule_id,
        blng__billingrule__c as sfdc_billing_rule_id,
        blng__billingtreatment__c as sfdc_billing_treatment_id,
        blng__calculatedquantity__c as calculated_quantity,
        blng__credits__c as credits,
        blng__dayspastdue__c as days_past_due,
        blng__debitpayments__c as debit_payments,
        blng__debits__c as debits,
        blng__impactamount__c as impact_amount,
        blng__invoicelinestate__c as invoice_line_state,
        blng__invoicelinestatus__c as invoice_line_status,
        blng__legalentityreference__c as sfdc_legal_entity_reference_id,
        blng__legalentity__c as sfdc_legal_entity_id,
        blng__negativelineconversion__c as negative_line_conversion,
        blng__netallocationsagainstinvoicelines__c as net_allocations_against_invoice_lines,
        blng__orderproduct__c as sfdc_order_item_id,
        blng__paymentsagainstdebitnotelines__c as payments_against_debit_note_lines,
        blng__paymentsagainstinvoicelines__c as payments_against_invoice_lines,
        blng__payments__c as payments,
        blng__refundsagainstdebitnotelines__c as refunds_against_debit_note_lines,
        blng__refundsagainstinvoicelines__c as refunds_against_invoice_lines,
        frequency_invoiceline__c as frequency_invoice_line,

        blng__taxcity__c as tax_city,
        blng__taxcountry__c as tax_country,
        blng__taxerror__c as tax_error,
        blng__taxglrule__c as sfdc_tax_gl_rule_id,
        blng__taxgltreatment__c as sfdc_tax_gl_treatment_id,
        blng__taxpercentageapplied__c as tax_percentage_applied,
        blng__taxrule__c as sfdc_tax_rule_id,
        blng__taxstate__c as tax_state,
        blng__taxstatus__c as tax_status,
        blng__taxstreet__c as tax_street,
        blng__taxtreatment__c as sfdc_tax_treatment_id,
        blng__taxzipcode__c as tax_zipcode,
        isdeleted as is_deleted,
        lastmodifieddate as last_modified_at,
        createddate as created_at,
        systemmodstamp as system_modstamp

    from source

)

select * from renamed