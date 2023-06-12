with

commits as (

    select * from {{ ref('stg_github__commits') }}

),

repository as (

    select * from {{ ref('stg_github__repositories') }}

),

user_emails as (

    select * from {{ ref('stg_github__user_emails') }}

),

users as (

-- pulling from int table to send PR data back into user data
    select * from {{ ref('int_github_users_prep') }}

),

joined as (

    select
        commits.*,
        repository.repo_name,
        users.github_username as committer_github_username,
        users.teams as committer_teams,
        users.user_id

    from commits
    left join repository
        on commits.repository_id = repository.repository_id
    left join user_emails
        on commits.committer_email = user_emails.email
    left join users
        on user_emails.user_id = users.user_id

)

select * from joined