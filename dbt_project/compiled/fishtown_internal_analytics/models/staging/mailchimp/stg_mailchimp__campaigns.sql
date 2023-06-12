with source as (

    select * from raw.mailchimp_data.campaigns

),

renamed as (

    select
        id as campaign_id,
        recipients:list_id::string as list_id,
        web_id,

        settings:subject_line::string as subject_line,
        settings:from_name::string as from_name,
        recipients:list_name::string as list_name,
        
        recipients,
        archive_url,
        long_archive_url,
        content_type,
        report_summary,
        settings,
        status,
        tracking,
        type,


        -- need to investigate what these means at a later time
        delivery_status,
        has_logo_merge_tag,
        needs_block_refresh,
        resendable,


        -- summary stats (usually derive this from raw data, but it was already here, so why not)
        emails_sent,
        recipients:recipient_count::integer as recipient_count,
        report_summary:click_rate::decimal(20,18) as click_rate,
        report_summary:open_rate::decimal(20,18) as open_rate,

        -- timestamps
        create_time as created_at,
        send_time as sent_at
        
    from source

)

select * from renamed