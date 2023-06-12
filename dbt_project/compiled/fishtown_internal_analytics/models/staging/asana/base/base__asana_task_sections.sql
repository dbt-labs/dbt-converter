with

source as (

    select * from raw.fivetran_asana_boards.task_section

),

renamed as (

    select
        md5(cast(coalesce(cast(section_id as TEXT), '') || '-' || coalesce(cast(task_id as TEXT), '') as TEXT)) as task_section_id,
        section_id,
        task_id

    from source

)

select * from renamed