with

source as (

    select * from {{ source('adp', 'classification') }}

),

renamed as (

    select
        id as classification_id,
        nullif(classification_short_name, '') as classification,
        classification_long_name as leadership_level

    from source

)

select * from renamed