with

source as (

    select * from raw.fivetran_github.pull_request

),

renamed as (

    select
        id as pull_request_id,
        base_sha,
        base_repo_id,
        base_user_id,
        head_sha,
        head_repo_id,
        head_user_id,
        issue_id,
        merge_commit_sha,
        base_label,
        base_ref,
        draft as is_draft,
        head_label,
        head_ref

    from source

)

select * from renamed