with

source as (

    select * from raw.fivetran_github.issue_merged

),

renamed as (

    select
        issue_id,
        commit_sha,
        actor_id,
        merged_at

    from source

)

select * from renamed