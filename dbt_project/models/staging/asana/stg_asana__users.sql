with

source as (

    select * from {{ source('asana', 'user') }}

),

renamed as (

    select
        id as user_id,
        initcap(name,' ') as user_name,
        email

    from source

)

select * from renamed