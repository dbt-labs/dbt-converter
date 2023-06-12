with 

source as (

    select * from raw.intercom_stitch.contacts

),

renamed as (

    select
        --ids
        id as contact_id,
        external_id as user_id,
        owner_id,
        workspace_id as app_id,
        
        --dimensions
        
        email,
        name,
        type,
        
        
        --boolean
        has_hard_bounced,
        marked_email_as_spam as has_marked_email_as_spam,
        unsubscribed_from_emails as has_unsubscribed_from_emails, 
        
        --variants
        avatar,
        companies,
        custom_attributes,
        location as location_data,
        social_profiles,
        tags,
        
        --dates
        created_at,
        updated_at
        
    from source
    where role = 'lead'
    
)

select * from renamed