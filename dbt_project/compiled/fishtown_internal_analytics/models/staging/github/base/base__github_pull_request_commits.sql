with

source as (

    select * from raw.fivetran_github.commit_pull_request

),

renamed as (

    select
        md5(cast(coalesce(cast(pull_request_id as TEXT), '') || '-' || coalesce(cast(commit_sha as TEXT), '') as TEXT)) as pull_request_commit_id,
        pull_request_id,
        commit_sha

    from source

)

select * from renamed