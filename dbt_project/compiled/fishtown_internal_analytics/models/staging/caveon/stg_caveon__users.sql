with source as (

    select * from raw.caveon.users
    where user is not null

),

renamed as (

    select distinct
        exam_id,
        expires_at,
        user:email::string as email,
        user:first_name::string as first_name,
        user:last_name::string as last_name,
        first_name || ' ' || last_name as full_name,
        user:last_modified_at::timestamp as last_modified_at,
        user_caveon_id as user_id

    from source

)

select * from renamed