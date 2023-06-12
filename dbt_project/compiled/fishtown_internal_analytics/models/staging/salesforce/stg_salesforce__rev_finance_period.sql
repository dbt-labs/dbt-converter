with

source as (

    select * from raw.salesforce.blng__FinancePeriod__c

),

renamed as (

    select
        id as sfdc_rev_finance_period_id,
        blng__financebook__c as sfdc_rev_finance_book_id,
        createdbyid as created_by_id,
        lastmodifiedbyid as last_modified_by_id,
        lastmodifieddate as last_modified_date,

        name as finance_period_name,
        blng__periodstatus__c as period_status,
        blng__periodstartdate__c::date as period_start_date,
        blng__periodenddate__c::date as period_end_date,

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