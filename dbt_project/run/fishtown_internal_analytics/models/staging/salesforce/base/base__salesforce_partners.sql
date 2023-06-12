
  create or replace   view analytics_dev.dbt_jstein.base__salesforce_partners
  
   as (
    with

source as (

    select * from raw.salesforce.partner__c

),

renamed as (

    select
        id as partner_id,
        createdbyid as created_by_id,
        ownerid as owner_id,
        lastmodifiedbyid as last_modified_by_id,
        account__c as account_id,
        account_type__c as account_type,
        name as partner_name,
        open_partner_pipeline__c as open_partner_pipeline,
        partnership_type__c as partnership_type,
        partnership_agreement_signed__c as partnership_agreement_signed_at, 
        preferred_partnership_date__c as preferred_partnership_date,
        dbt_labs_partner_manager__c as partner_manager_id, 
        total_partner_pipeline_contribution__c as total_partner_pipeline_contribution,
        total_won_arr_sourced_influenced__c as total_won_arr_sourced_influenced,
        total_won_sourced_arr_sourced_only__c as total_won_sourced_arr_sourced_only,
        isdeleted as is_deleted,
        createddate as created_at,
        lastmodifieddate as last_modified_date

    from source

)

select * from renamed
  );

