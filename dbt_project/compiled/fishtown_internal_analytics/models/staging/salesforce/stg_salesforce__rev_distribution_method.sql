with

source as (

    select * from raw.salesforce.blng__RevenueDistributionMethod__c

),

renamed as (

    select
        id as sfdc_rev_distribution_method_id,
        blng__monthlyrecognitionproration__c as monthly_recognition_proration,
        blng__revenuetransactioncreationprocess__c as rev_transaction_creation_process,

        createdbyid as created_by_id,
        ownerid as owner_id,
        lastmodifiedbyid as last_modified_by_id,
        lastmodifieddate as last_modified_date,

        name as rev_distribution_method_name,
        blng__distributionmethod__c as rev_distribution_method_type,
        blng__type__c as billing_type,

        isdeleted as is_deleted,
        createddate as created_date,

        systemmodstamp as system_modstamp,
        _sdc_batched_at,
        _sdc_extracted_at,
        _sdc_received_at,
        _sdc_sequence,
        _sdc_table_version

    from source

)

select * from renamed