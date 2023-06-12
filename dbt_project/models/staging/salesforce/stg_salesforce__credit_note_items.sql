with

source as (

    select * from {{ source('salesforce', 'credit_note_item') }}

), 

renamed as (

    select
        id as sfdc_credit_note_item_id,
        blng__CreditNote__c as sfdc_credit_note_id,
        blng__product__c as sfdc_product_id
        
    from source
)

select * from renamed