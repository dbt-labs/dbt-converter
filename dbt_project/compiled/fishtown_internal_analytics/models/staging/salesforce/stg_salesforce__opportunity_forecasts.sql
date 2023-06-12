

with

source as (

      select * from raw.salesforce.opportunity_forecast__c
),

renamed as (

    select
        id as opp_forecast_id,
        lastmodifiedbyid as last_modified_by_id,
        createdbyid as created_by_id,

    --INFO
        name as opportunity_name,
        opportunity__c as opportunity_id,
        probability__c as probability,
        stage__c as opportunity_stage,
        status__c as opportunity_status,
        type__c as opportunity_type,

    --OPP/LEAD INFO
        opportunity_owner__c as opportunity_owner,
        technical_lead__c as technical_lead,
        forecast__c as forecast,
        forecast_category__c as forecast_category,

    --MONEY
        delta_arr__c as delta_arr,
        expected_delta_arr__c as expected_delta_arr,
        starting_arr__c as starting_arr,
        ending_arr__c as ending_arr,
        opp_forecast_amount__c as opp_forecast_amount,

    --MISC
        systemmodstamp as systemmodst,
        isdeleted as is_deleted,

    --DATES
        opp_forecast_date__c as opp_forecast_date,
        close_date__c as close_date,
        close_date_this_quarter__c as close_date_this_quarter,
        contract_start_date__c as contract_start_date,
        contract_end_date__c as contract_end_date,
        opp_forecast_needs_to_be_updated__c as opp_forecast_needs_to_be_updated,
        opp_last_modified_date__c as opp_last_modified_date,
        lastmodifieddate as last_modified_date,
        createddate as created_date

    from source

)

select * from renamed