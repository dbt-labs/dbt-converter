with

source as (

    select * from {{ source('fivetran_github', 'commit_pull_request') }}

),

renamed as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'pull_request_id',
            'commit_sha'
        ])}} as pull_request_commit_id,
        pull_request_id,
        commit_sha

    from source

)

select * from renamed
