with

source as (

    select * from raw.fivetran_jira.status

),

renamed as (

    select 
        id::varchar as status_id,
        status_category_id,

        name as status_name,
        description as status_description

    from source

)

select * from renamed