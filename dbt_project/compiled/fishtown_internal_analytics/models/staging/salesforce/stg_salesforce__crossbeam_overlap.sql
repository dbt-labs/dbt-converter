with

source as (

    select * from raw.salesforce.xbeamprod__Crossbeam_Overlap__c

),

renamed as (

    select

        -- identifiers
        id as crossbeam_overlap_id,
        createdbyid as created_by_id,
        lastmodifiedbyid as last_modified_by_id,
        ownerid as owner_id,
        
        -- dimensions
        name as crossbeam_overlap_name,
        xbeamprod__account__c as salesforce_account_id,
        xbeamprod__crossbeam_eid__c as crossbeam_company_record_id,
        xbeamprod__opportunity__c as salesforce_opportunity_id,
        xbeamprod__partner_account__c as partner_account_name,
        xbeamprod__partner_ae_email__c as partner_contact_email,
        xbeamprod__partner_ae_name__c as parter_ae_name,
        xbeamprod__partner_ae_phone__c as partner_ae_phone,
        xbeamprod__partner_name__c as partner_name,
        xbeamprod__partner_population__c as partner_population,
        xbeamprod__population__c as dbt_population,

        -- booleans
        isdeleted as is_deleted,

        -- timestamps
        createddate as created_at,
        lastmodifieddate as last_modified_at,
        systemmodstamp as system_modstamp,
        _sdc_batched_at
        

    from source

)

select * from renamed