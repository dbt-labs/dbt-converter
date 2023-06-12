with

source as (

    select * from {{ source('netsuite','vendor') }}
    where _fivetran_deleted = false
    
),

renamed as (

    select
        -- ids
        id as vendor_id,

        -- dimensions
        altname as vendor_name,
        legalname as vendor_legal_name,
        companyname as vendor_company_name,
        firstname as vendor_person_first_name,
        lastname as vendor_person_last_name,
        email as vendor_email,
        entityid as entity_identifier,
        try_to_boolean(duplicate) as is_duplicate,
        try_to_boolean(isinactive) as is_inactive,
        try_to_boolean(isperson) as is_person,

        -- date / times
        lastmodifieddate as last_modified_at,

        --- metadata
        _fivetran_synced  

    from source

)

select * from renamed
