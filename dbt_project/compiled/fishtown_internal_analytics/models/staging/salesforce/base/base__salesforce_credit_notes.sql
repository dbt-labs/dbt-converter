with

source as (

    select * from raw.salesforce.blng__CreditNote__c

), 

renamed as (

    select
        id as sfdc_credit_note_id,
        name as credit_note_name,
        blng__Account__c as sfdc_account_id
        
    from source

)

select * from renamed