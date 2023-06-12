with

source as (

    select * from raw.fivetran_asana_boards.project

),

renamed as (

    select
        id as project_id,
        owner_id,
        workspace_id,
        team_id,
        name as project_name,
        notes,
        archived as is_archived,
        case when project_name ilike '%template%' then 1 else 0 end as is_template,
        _fivetran_deleted as is_deleted,
        current_status,
        current_status_color,
        created_at,
        modified_at,
        due_date

    from source

)

select * from renamed