with

source as (

    select * from raw.fivetran_asana_boards.user

),

renamed as (

    select
        id as user_id,
        initcap(name,' ') as user_name,
        email

    from source

)

select * from renamed