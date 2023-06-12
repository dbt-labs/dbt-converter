with

source as (

    select * from raw.fivetran_jira.field

),

renamed as (
    
    select 
        id as field_id,
        name as field_name,
        is_custom,
        is_array

    from source

)

select * from renamed