with source as (

    select * from analytics.snapshots.mailchimp_members_snapshot

),

renamed as (

    select
        dbt_scd_id as id,
        id as list_member_id,
        list_id,
        web_id,
        email_address,
        email_client,
        email_type,
        ip_opt,
        ip_signup,
        language,
        last_changed,
        location,
        member_rating,
        merge_fields,
        source,
        stats,
        status,
        tags,
        tags_count,
        timestamp_opt,
        timestamp_signup,
        unique_email_id,
        unsubscribe_reason,
        vip,
        --snapshot fields
        dbt_updated_at,
        dbt_valid_from,
        dbt_valid_to


    from source

)

select * from renamed