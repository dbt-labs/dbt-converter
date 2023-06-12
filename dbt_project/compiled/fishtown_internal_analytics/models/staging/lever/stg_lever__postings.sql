with source as (

    select * from raw.fivetran_lever.posting

),

renamed as (

    select
        id as posting_id,
        hiring_manager_id,
        owner_id,
        creator_id,

        state as posting_status,
        text as role_title,

        categories_team as team_name,
        categories_location as role_location,
        categories_commitment as role_commitment,
        categories_level as role_level,

        content_description,
        content_closing,

        created_at,
        updated_at

    from source

)

select * from renamed