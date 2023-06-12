with

source as (

    select * from raw.fivetran_adp_workforce_now.classification

),

renamed as (

    select
        id as classification_id,
        nullif(classification_short_name, '') as classification,
        classification_long_name as leadership_level

    from source

)

select * from renamed