with 

source as (

    select * from raw.salesforce.Territory_State_Province__c

),

renamed as (

    select
        --identifiers
        id as territory_state_id,
        createdbyid as created_by_id,
        external_id__c as external_id,
        lastmodifiedbyid as last_modifieid_by_id,
        new_territory__c as new_territory_id,
        previous_territory__c as previous_territory_id,
        territory__c as territory_id,
        territory_country__c as territory_country_id,

        --dimensions
        name as state_province,
        
        -- measures
        of_territory_zip_postal_codes__c as count_of_zip_or_postal_codes,

        -- booleans
        isdeleted as is_deleted,

        --timestamps
        createddate as created_at,
        lastmodifieddate as last_modified_at,
        systemmodstamp as system_modstamp,
        _sdc_batched_at

    from source

)

select * from renamed