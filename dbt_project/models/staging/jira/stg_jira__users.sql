with

source as (

    select * from {{ source('jira', 'user') }}

),

renamed as (

    select 
        id as user_id,
        email,
        name as user_display_name,
        username,
        locale,
        time_zone

    from source

)

select * from renamed