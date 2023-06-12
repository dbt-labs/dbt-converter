with

source as (

    select * from raw.salesforce.blng__CreditNoteLine__c

), 

renamed as (

    select
        id as sfdc_credit_note_item_id,
        blng__CreditNote__c as sfdc_credit_note_id
        
    from source
)

select * from renamed