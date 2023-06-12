with

source as (

    select * from {{ source('fivetran_github', 'commit') }}

),

renamed as (

    select
        sha as commit_sha,
        repository_id,
        author_email,
        author_name,
        committer_email,
        committer_name,
        message,
        author_date,
        committer_date

    from source

)

select * from renamed