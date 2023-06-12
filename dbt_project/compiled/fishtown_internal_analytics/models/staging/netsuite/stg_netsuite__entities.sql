with

source as (

    select * from raw.fivetran_netsuite_suiteanalytics.entity
    where _fivetran_deleted = false
    
),

renamed as (

    select
        --ids
        id as entity_id,
        toplevelparent as top_level_parent_entity_id,
        parent as parent_entity_id,
        contact as contact_id,
        customer as customer_id,
        employee as employee_id,
        'group' as entity_group_id,
        othername as other_name_id,
        vendor as vendor_id,

        -- dimensions
        type as entity_type,
        altname as entity_name,
        firstname as entity_first_name,
        lastname as entity_last_name,
        entityid as entity_identifier,
        try_to_boolean(isinactive) as is_inactive,
        try_to_boolean(isperson) as is_person,

        -- date/times
        datecreated as created_at,
        lastmodifieddate as last_modified_at,
        
        -- metadata
        _fivetran_synced

    from source

)

select * from renamed