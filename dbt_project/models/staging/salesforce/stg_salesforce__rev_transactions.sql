with source as (

    select * from {{ source('salesforce', 'revenue_transaction') }}

),

renamed as (

    select
        id as sfdc_rev_transaction_id,
        name as revenue_transaction_code,
        blng__revenueamount__c as rev_transaction_amount,
        blng__previouslyrecognizedrevenue__c as prev_rev_transaction_amount,
        blng__status__c as status,
        blng__revenuedistributionmethod__c as distribution_method,
        blng__revenuefinancebook__c as rev_finance_book,
        blng__systemperiodstartdate__c as period_start_date,

        blng__revenuefinanceperiod__c as sfdc_rev_finance_period_id,
        blng__revenueschedule__c as sfdc_rev_schedule_id,
        blng__revenuerecognitiontreatment__c as sfdc_rev_rec_treatment_id,
        blng__deferredbalance__c as sfdc_deferred_balance_id,
        blng__legalentity__c as sfdc_legacy_entity_id,
        blng__revenuerecognitiongltreatment__c as sfdc_rev_rec_gl_treatment_id,
        blng__revenuerecognitionglrule__c as sfdc_rev_rec_gl_rule_id,
        blng__revenuerecognitionrule__c as sfdc_rev_rec_rule_id,
        blng__orderproduct__c as sfdc_order_item_id,

        createdbyid as created_by_id,
        createddate as created_at,
        lastmodifiedbyid as last_modified_by_id,
        lastmodifieddate as last_modified_date,

        isdeleted as is_deleted,

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
