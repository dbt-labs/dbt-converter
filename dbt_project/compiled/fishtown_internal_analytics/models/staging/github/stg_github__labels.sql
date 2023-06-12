with

source as (

    select * from raw.fivetran_github.label

),

renamed as (

    select
        id as label_id,
        name as label_name,
        url,
        color,
        description,
        is_default

    from source

)

select * from renamed