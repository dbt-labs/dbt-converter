with

source as (

    select * from raw.salesforce.blng__invoice__c
    where not isdeleted

),

renamed as (

    select
        id as invoice_id,
        blng__uniqueid__c as unique_id,
        blng__account__c as account_id,
        blng__billtocontact__c as billing_contact_id,
        createdbyid as created_by_id,
        lastmodifiedbyid as last_modified_by_id,

    --Invoice Info
        account_name_invoice__c as account_name_invoice,
        name as invoice_number,
        blng__subtotal__c as subtotal,
        blng__taxamount__c as tax_amount,
        blng__taxerrors__c as tax_errors,
        blng__taxstatus__c as tax_status,
        blng__totalamount__c as total_amount,
        blng__invoicestatus__c as invoice_status,
        blng__paymentstatus__c as payment_status,

        case when invoice_status in (
            'Draft',
            'Error',
            'Initiated',
            'Posted',
            'Cancelled',
            'Rebilled',
            'Post in progress')
                then true
            else false
        end as is_open_invoice,

        payment_status != 'Unpaid' as is_paid,

        blng__targetdate__c as target_date,
        blng__duedate__c as due_date,
        blng__invoicedate__c as invoice_date,
        min_start_date__c as start_date,
        max_end_date__c as end_date,

    --Bank Info
        aba_routing_number__c as aba_routing_number,
        account_number__c as account_number,
        bank_name__c as bank_name,
        blng__balance__c as balance,
        blng__credits__c as credits,

        blng__daysoutstanding__c as days_outstanding,
        blng__debitpayments__c as debit_payments,
        blng__debits__c as debits,
        blng__impactamount__c as impact_amounts,
        blng__negativelineconversion__c as negative_line_conversion,
        blng__numberofinvoicelines__c as number_of_invoice_lines,
        blng__order__c as invoice_order,
        blng__paymentsagainstinvoicelines__c as payments_against_invoice_lines,
        blng__paymentsagainstinvoice__c as payments_against_invoice,
        blng__payments__c as payments,
        blng__refundsagainstinvoicelines__c as refunds_against_invoice_lines,
        blng__refundsagainstinvoice__c as refunds_against_invoice,
        blng__statusflag__c as status_flag,
        isdeleted as is_deleted,
        lastmodifieddate as last_modified_at,
        payment__c as payment,
        swift_code__c as swift_code,
        systemmodstamp as system_modstamp,
        createddate as created_at

    from source

)

select * from renamed