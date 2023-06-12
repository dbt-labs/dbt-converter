with

source as (

    select * from raw.fivetran_asana_boards.project_task

),

renamed as (

    select
        md5(cast(coalesce(cast(project_id as TEXT), '') || '-' || coalesce(cast(task_id as TEXT), '') as TEXT)) as project_task_id,
        project_id,
        task_id

    from source

)

select * from renamed