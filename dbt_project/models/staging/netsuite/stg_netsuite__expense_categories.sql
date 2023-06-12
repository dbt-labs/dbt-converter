with

source as (

    select * from {{ source('netsuite','expense_category') }}
    where _fivetran_deleted = false
    
),

renamed as (

    select
        --ids
        id as expense_category_id,
        expenseacct as expense_account_id,

        -- dimensions
        name as expense_category_name,
        try_to_boolean(isinactive) as is_inactive,
              
        -- date/times
        lastmodifieddate as last_modified_at,
        
        -- metadata
        _fivetran_synced

    from source

)

select * from renamed
