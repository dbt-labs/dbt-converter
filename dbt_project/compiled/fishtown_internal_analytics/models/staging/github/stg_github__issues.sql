with

source as (

    select * from raw.fivetran_github.issue

),

renamed as (

    select
        id as issue_id,
        user_id,
        milestone_id,
        repository_id,
        number as pull_request_number,
        pull_request as is_pull_request,
        state,
        title,
        body,
        locked as is_locked,
        closed_at,
        created_at,
        updated_at

    from source

)

select * from renamed