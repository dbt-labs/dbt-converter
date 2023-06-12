with source as (

    select * from {{ source('lever', 'user') }}

),

renamed as (

    select
        id as user_id,
        external_directory_id,

        name as user_name,
        photo,
        username,
        email,
        access_role,
        created_at,
        deactivated_at

    from source

)

select * from renamed
