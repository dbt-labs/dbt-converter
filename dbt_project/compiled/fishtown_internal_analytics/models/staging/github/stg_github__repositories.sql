with

source as (

    select * from raw.fivetran_github.repository

),

renamed as (

    select
        id as repository_id,
        owner_id,
        name as repo_name,
        full_name as full_repo_name,
        description,
        default_branch,
        homepage,
        fork as is_fork,
        archived as is_archived,
        language,
        private as is_private,
        created_at

    from source

)

select * from renamed