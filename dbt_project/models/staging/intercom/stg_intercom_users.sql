with 

source as (
    
    select * from {{ source( 'intercom', 'contacts')}}
),

renamed as (

    select
        --ids
        id as submitter_id,
        external_id as user_id,
        owner_id,
        workspace_id as app_id,
        
        --dimensions
        name as user_name,
        email,
        lower(split_part(email , '@', 2)) as domain,
        case 
            when domain ilike '%fishtownanalytics%' then 1
            else 0
        end as is_fishtown_user,
        'user' as type,
        location:city::varchar as city_name,
        location:country::varchar as country_name,
        custom_attributes:"Count Associated Accounts"::number as count_associated_cloud_accounts,
        custom_attributes:"Is Account Creator?"::boolean as is_account_creator,
        
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
        signed_up_at,
        updated_at
        
    from source
    where role = 'user'
    
)

select * from renamed