with

credentials as (

    select * from {{ source('salesforce', 'credential') }}

), 

renamed as (

    select
        partnership__c as partner_id,
        credential_exam_id__c as credential_exam_id
        
    from credentials

)

select * from renamed