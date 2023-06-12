with source as (

    select * from {{ source('fivetran_log', 'user') }}

),

renamed as (

    select
        id as user_id,
        given_name,
        family_name,
        given_name || ' ' || family_name as name,
        email,
        email_disabled,
        phone,
        verified,
        created_at

    from source 

)

select * from renamed