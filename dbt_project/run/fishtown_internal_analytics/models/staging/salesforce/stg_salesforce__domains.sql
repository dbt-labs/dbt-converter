
  create or replace   view analytics_dev.dbt_jstein.stg_salesforce__domains
  
   as (
    with

source as (

    select * from raw.salesforce.domain__c

),

renamed as (

    select
        -- identifiers
        id as domain_id,
        account__c as account_id,
        createdbyid as created_by_id,
        lastmodifiedbyid as last_modified_by_id,
        ownerid as owner_id,
        suffix__c as suffix_id,
        top_level_domain__c as top_level_domain_id,

        -- dimensions
        bottom_level_domain_name__c as bottom_level_domain_name,
        depth__c as depth,
        host__c as host,
        key__c as key,
        name as domain_name,
        sub_domain__c as sub_domain,
        suffix_name__c as suffix_name,
        top_level_domain_name__c as top_level_domain_name,

        -- booleans
        consumer_domain__c as is_consumer_domain,
        domain_match_override__c as is_domain_match_override,
        format_inspected__c as was_format_inspected,
        isdeleted as is_deleted,
        spam__c as is_spam,
        valid_format__c as is_valid_format,

        -- timestamps
        createddate as created_at,
        lastmodifieddate as last_modified_at,
        lastreferenceddate as last_referenced_at,
        lastvieweddate as last_viewed_at,
        systemmodstamp as system_modstamp,
        _sdc_batched_at
        
    from source

)

select * from renamed
  );

