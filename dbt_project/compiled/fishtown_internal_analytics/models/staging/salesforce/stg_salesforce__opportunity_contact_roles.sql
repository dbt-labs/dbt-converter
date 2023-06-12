with

source as (

    select * from raw.salesforce.opportunitycontactrole

),

renamed as (

    select
        --identifiers
        id as opportunity_contact_role_id,
        contactid as contact_id,
        createdbyid as created_by_id,
        lastmodifiedbyid as last_modified_by_id,
        opportunityid as opportunity_id,

        --dimensions
        role as contact_role,
        
        -- booleans
        isdeleted as is_deleted,
        isprimary as is_primary,

        --timestamps
        createddate as created_at,
        lastmodifieddate as last_modified_at,
        systemmodstamp as system_modstamp

    from source

)

select * from renamed