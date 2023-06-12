with

source as (

    select * from raw.fivetran_jira.project_board

),

renamed as (

    select
        md5(cast(coalesce(cast(project_id as TEXT), '') || '-' || coalesce(cast(board_id as TEXT), '') as TEXT)) as project_board_id,
        project_id,
        board_id

    from source
    where not _fivetran_deleted

)

select * from renamed