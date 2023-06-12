with

source as (

    select * from raw.salesforce.blng__RevenueRecognitionTreatment__c

),

renamed as (

    select
        id as sfdc_rev_rec_treatment_id,
        blng__revenuedistributionmethod__c as sfdc_rev_distribution_method_id,
        blng__revenuefinancebook__c as sfdc_rev_finance_book_id,
        blng__revenueglrule__c as sfdc_rev_gl_rule_id,
        blng__revenuerecognitionrule__c as sfdc_rev_rec_rule_id,

        createdbyid as created_by_id,
        lastmodifiedbyid as last_modified_by_id,
        lastmodifieddate as last_modified_date,

        name as rev_rec_treatment_name,
        blng__processingorder__c as processing_order_num,
        blng__revenueschedulecreationaction__c as revenue_schedule_creation_action,
        blng__type__c as billing_type,

        isdeleted as is_deleted,
        createddate as created_date,

        systemmodstamp as system_modstamp,
        lastvieweddate as last_viewed_date,
        lastreferenceddate as last_referenced_date,
        _sdc_batched_at,
        _sdc_extracted_at,
        _sdc_received_at,
        _sdc_sequence,
        _sdc_table_version

    from source

)

select * from renamed