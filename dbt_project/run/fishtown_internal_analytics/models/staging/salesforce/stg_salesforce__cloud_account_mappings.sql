
  create or replace   view analytics_dev.dbt_jstein.stg_salesforce__cloud_account_mappings
  
   as (
    with

source as (

    select * from raw.salesforce.dbt_cloud_account__c

),

renamed as (

    select
    --- ids
        id as cloud_account_mapping_id,
        --NOTE: account_id_18__c is also the cloud_account_mapping_id

        account__c as account_id,
        coalesce(cloud_id__c::varchar, cloud_id__c__st) as cloud_account_id,
        ownerid as owner_id,
        createdbyid as created_by_id,
        lastmodifiedbyid as last_modified_by_id,

        name as cloud_account_name,

        isdeleted as is_deleted,

        case
            when is_primary__c
            and lastmodifieddate = max(lastmodifieddate) 
                over (partition by account_id) 
            then true
            else false
        end as is_primary,

        account_override__c as is_account_override,

    --- dates and timestamps    
        createddate as created_at,
        to_date(createddate) as created_date,
        lastmodifieddate as last_modified_at,
        lastreferenceddate as last_referenced_at,
        lastvieweddate as last_viewed_at,
        systemmodstamp

    from source

)

select * from renamed
  );

