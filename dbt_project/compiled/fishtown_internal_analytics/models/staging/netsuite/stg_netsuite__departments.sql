with

source as (

    select * from raw.fivetran_netsuite_suiteanalytics.department
    where _fivetran_deleted = false
    
),

renamed as (

    select
        --ids
        id as department_id,
        parent as parent_department_id,

        -- dimensions
        name as department_name,
        fullname as department_name_with_parent_names,
        try_to_boolean(isinactive) as is_inactive,
        
        -- date/times
        lastmodifieddate as last_modified_at,
        
        -- metadata
        _fivetran_synced

    from source

)

select * from renamed