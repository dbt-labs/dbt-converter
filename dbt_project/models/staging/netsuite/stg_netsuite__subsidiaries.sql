with

source as (

    select * from {{ source('netsuite','subsidiary') }}
    where _fivetran_deleted = false
    
),

renamed as (

    select
        --ids
        id as subsidiary_id,
        currency as subsidiary_currency_id,
        parent as parent_subsidiary_id,
        coalesce(parent_subsidiary_id, subsidiary_id) as parent_or_top_level_subsidiary_id,

        -- dimensions
        country as subsidiary_country_code,
        name as subsidiary_name,
        fullname as subsidiary_name_with_parent_names,
        legalname as subsidiary_legal_name,
        try_to_boolean(iselimination) as is_elimination_subsidiary,
        try_to_boolean(isinactive) as is_inactive,
        tranprefix as transaction_prefix,

        -- date/times
        lastmodifieddate as last_modified_at,
        
        -- metadata
        _fivetran_synced

    from source

)

select * from renamed
