with source as (

    select * from {{ source('hubspot', 'marketing_email') }}

),

renamed as (

    select
        id as marketing_email_id,
        ab_test_id,
        analytics_page_id,
        author_user_id,
        can_spam_settings_id,
        feedback_survey_id,
        folder_id,
        lead_flow_id,
        page_expiry_redirect_id,
        campaign as parent_campaign_id,
        portal_id,
        published_by_id,
        subscription as subscription_id,
        subscription_blog_id,
        updated_by_id,
        ab_hours_to_wait,
        ab_sample_size_default,
        ab_sampling_default,
        ab_status,
        ab_success_metric,
        ab_test_percentage,
        absolute_url,
        analytics_page_type,
        author,
        author_email,
        author_name,
        blog_email_type,
        cloned_from,
        domain,
        email_body,
        name as email_name,
        email_note,
        email_type,
        feedback_email_category,
        from_name,
        live_domain,
        meta_description,

        -- The Hubspot API is not register campaign name changes via their API
        -- This is a temporary solution to fixed a changed campaign
        case
            when campaign = 'b5bf26f6-a4e9-45f6-a434-ab2474e60963' then 'q1-2022_dbt-101-live-session_awareness'
            else campaign_name
        end as parent_campaign_name, 

        preview_key,
        processing_status,
        published_by_name,
        published_url,
        reply_to,
        resolved_domain,
        slug,
        subcategory,
        subject,
        subscription_name,
        transactional,
        url,

        ab as has_ab_test,
        create_page as has_created_page,
        page_redirected as has_page_redirected,

        ab_variation as is_ab_variation,
        archived as is_archived,
        currently_published as is_currently_published,
        is_graymail_suppression_enabled,
        is_local_timezone_send,
        publish_immediately as is_publish_immediately,
        is_published,
        is_recipient_fatigue_suppression_enabled,
        transactional as is_transactional,

        author_at,
        created as created_at,
        freeze_date,
        page_expiry_date,
        publish_date,
        published_at,
        unpublished_at,
        updated as updated_at

    from source

)

select * from renamed