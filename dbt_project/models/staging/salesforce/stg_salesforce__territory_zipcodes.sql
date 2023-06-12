with 

source as (

    select * from {{ source('salesforce', 'territory_zipcode') }}

),

renamed as (

    select
        --identifiers
        id as territory_zipcode_id,
        createdbyid as created_by_id,
        external_id__c as external_id,
        lastmodifiedbyid as last_modifieid_by_id,
        new_territory__c as new_territory_id,
        previous_territory__c as previous_territory_id,
        territory__c as territory_id,
        
        territory_state_province__c as territory_state_id,

        --dimensions
        territory_city__c as city,
        name as zipcode,

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