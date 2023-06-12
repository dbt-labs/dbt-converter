with source as (

    select * from raw.fivetran_linkedin_organic.share_history

),

renamed as (

    select
        id as share_id,
        original_share_id,
        reshared_share_id,
        split_part(activity,':',-1) as activity_id,
        
        activity,
        agent,
        content_description,
        content_title,
        content_share_media_category,
        content_landing_page_url,
        content_content_entities,
        content_content_entities[0]:landingPageUrl::string as landing_page_url,
        created_actor,
        owner,
        subject,
        text,
        text_annotations,
        last_modified_actor,
        client_app,

        distribution_target_connections_only as is_connections_only,
        distribution_target_visible_to_guest as is_visible_to_guests,

        created_time as created_at,
        last_modified_time as last_modified_at

    from source
    -- since the source table contains a share's history, we need to filter to retrieve latest version
    qualify row_number() over (
        partition by id
        order by last_modified_time desc
    ) = 1

)

select * from renamed