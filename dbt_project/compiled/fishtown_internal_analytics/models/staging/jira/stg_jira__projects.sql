

with

source as (

    select * from raw.fivetran_jira.project

),

renamed as (

    select 
        id as project_id,
        key as project_key,
        lead_id as project_lead_user_id,
        project_category_id,
        permission_scheme_id,

        name as project_name,
        description as project_description

    from source
    where not _fivetran_deleted

)

select * from renamed