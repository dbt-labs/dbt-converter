with

source as (

    select * from {{ source('fivetran_github', 'pull_request_review') }}

),

renamed as (

    select
        id as pull_request_review_id,
        pull_request_id,
        body,
        submitted_at,
        state,
        user_id,
        commit_sha

    from source

)

select * from renamed
