with source as (

    select * from raw.fivetran_hubspot.calendar_event

),

renamed as (

    select
        id as calendar_event_id,
        campaign_guid as parent_campaign_id,
        category_id,
        content_id,
        content_group_id,
        group_id,
        owner_id,
        portal_id,

        case
            when category = 'linkedincompanypage'
                then split_part(url,':',-1)
            when category = 'twitter'
                then split_part(url,'/',-1)
        end as post_id,

        user_id,

        avatar_url,
        category,
        created_by,
        create_content,
        description,
        event_type,
        group_order,
        name,
        preview_key,
        social_display_name,
        social_username,
        state,
        template_path,
        url,
        
        is_recurring,

        event_date as event_at
    
    from source

)

select * from renamed