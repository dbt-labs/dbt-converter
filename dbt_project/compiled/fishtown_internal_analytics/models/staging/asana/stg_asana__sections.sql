with

source as (

    select * from raw.fivetran_asana_boards.section

),

renamed as (

    select
        id as section_id,
        project_id,
        name as section_name,
        created_at

    from source

)

select * from renamed