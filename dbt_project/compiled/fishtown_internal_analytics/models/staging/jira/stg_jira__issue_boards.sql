

with

source as (

    select * from raw.fivetran_jira.issue_board

),

renamed as (

    select
        md5(cast(coalesce(cast(issue_id as TEXT), '') || '-' || coalesce(cast(board_id as TEXT), '') as TEXT)) as issue_board_id,
        issue_id,
        board_id

    from source
    where not _fivetran_deleted

)

select * from renamed