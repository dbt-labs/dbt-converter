

with

source as (

    select * from raw.slack.channels

),

renamed as (

    select
        -- ids
        id as channel_id,
        creator as creator_id,

        is_archived,
        is_channel,
        is_general,
        is_member,
        is_mpim,
        is_org_shared,
        is_private,
        is_shared,
        members,
        name,
        name_normalized,
        num_members,
        previous_names,
        purpose,
        topic,
        unlinked,

        -- timestamps
        created as created_at

    from source

)

select * from renamed