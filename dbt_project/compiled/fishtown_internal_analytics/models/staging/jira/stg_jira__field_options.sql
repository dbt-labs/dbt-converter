with

source as (

    select * from raw.fivetran_jira.field_option

),

renamed as (
    
    select 
        id::varchar as field_option_id,
        parent_id,
        name as field_option_name

    from source

)

select * from renamed