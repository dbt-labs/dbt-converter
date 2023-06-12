with 

source as (

    select * from raw.intercom_stitch.companies

),

renamed as (

    select
    
        --ids
        id as company_id,
        company_id as cloud_account_id,
        
        --dimensions
        monthly_spend,
        name as company_name,
        session_count as company_session_count,
        type, 
        user_count,
        
        --variants
        custom_attributes,
        plan:name::varchar as company_plan, 
        tags,
        
        --dates
        created_at,
        updated_at
        
    from source

)

select * from renamed