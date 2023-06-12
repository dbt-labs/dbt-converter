with

source as (

    select * from {{ source('fivetran_github', 'user') }}

),

engineering_team_assignments as (

    select * from {{ ref('stg_seed__github_engineering_team_mappings')}}

),

renamed as (

    select
        id as user_id,
        type as user_type,
        site_admin as is_site_admin,
        login as github_username,
        name,
        company,
        engineering_team_name as engineering_team_assignment,
        blog,
        location,
        hireable as is_hireable,
        bio,
        created_at,
        updated_at

    from source
    left join engineering_team_assignments
      on source.login = engineering_team_assignments.github_username

)

select * from renamed
