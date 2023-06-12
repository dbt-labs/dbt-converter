with

source as (

    select * from {{ source('salesforce', 'credit_note') }}

), 

renamed as (

    select
        id as sfdc_credit_note_id,
        name as credit_note_name,
        blng__creditnotedate__c::date as credit_note_date,
        blng__Account__c as sfdc_account_id,
        blng__subtotal__c as subtotal_amount,
        blng__taxamount__c as tax_amount,
        blng__notes__c as notes
        
    from source

)

select * from renamed