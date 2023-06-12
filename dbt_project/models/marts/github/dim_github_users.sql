with

users as (

    select * from {{ ref('stg_github__users') }}

),

commits as (

    select * from {{ ref('fct_github_commits') }}

),

first_commits as (

    select 
        user_id,
        min(committer_date) as first_overall_commit_date,
        min(
            case
                when committer_teams is not null
                    then committer_date
            end
            ) as first_internal_commit_date
    from commits
    group by 1

),

users_with_activity as (

    select 
        users.*,
        first_overall_commit_date,
        first_internal_commit_date

    from users
    left join first_commits using (user_id)

)

select * from users_with_activity