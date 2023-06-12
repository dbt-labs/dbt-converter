with source as (

    select * from raw.fivetran_lever.opportunity

),

opps as (

    select
        id as opportunity_id,
        archived_reason_id as archive_reason_id,
        owner_id,
        stage_id,
        contact as contact_id,

        origin,

        archived_at is not null as is_archived,

        snoozed_until,
        is_anonymized,
        data_protection_store_allowed,
        data_protection_contact_allowed,

        data_protection_store_expires_at,
        data_protection_contact_expires_at,

        created_at,
        last_interaction_at,
        last_advanced_at,
        updated_at,
        archived_at

    from source

)

select * from opps