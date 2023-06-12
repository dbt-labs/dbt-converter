with 

source as (

    select * from raw.salesforce.Territory_Country__c

),

renamed as (

    select
        --identifiers
        id as territory_country_id,
        createdbyid as created_by_id,
        external_id__c as external_id,
        lastmodifiedbyid as last_modifieid_by_id,
        new_territory__c as new_territory_id,
        ownerid as owner_id,
        territory__c as territory_id,

        --dimensions
        name as country_name,

        -- measures
        of_territory_states_provinces__c as count_of_states_or_provinces,

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