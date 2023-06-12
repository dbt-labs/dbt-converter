with

source as (

    select * from raw.salesforce.blng__RevenueSchedule__c

),

renamed as (

    select
        id as sfdc_rev_schedule_id,
        blng__revenuerecognitiontreatment__c as sfdc_rev_rec_treatment_id,
        name as revenue_schedule_code,
        blng__revenuestartdate__c::date as revenue_start_date,
        blng__revenueenddate__c::date as revenue_end_date,

        blng__totalrevenueamount__c as total_revenue_amount,
        createdbyid as created_by_id,
        ownerid as owner_id,

        -- the raw fields with _1 were created after the fields without suffixes
        credit_account__c as credit_account_line_1,
        credit_account_1__c as credit_account_line_2,
        debit_account__c as debit_account_line_1,
        debit_account_1__c as debit_account_line_2,

        lastmodifiedbyid as last_modified_by_id,
        lastmodifieddate as last_modified_date,

        opportunity_name__c as opportunity_name,
        blng__OrderProduct__c as sfdc_order_item_id,
        blng__creditnoteline__c as sfdc_credit_note_item_id,
        order_product_start_date__c::date as order_product_start_date,
        product__c as product_name,
            --e.g. dbt Learn, Rapid Onboarding-Lite
        product_1__c as product_category,
            --e.g. dbt Learn

        isdeleted as is_deleted,
        createddate as created_at,

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