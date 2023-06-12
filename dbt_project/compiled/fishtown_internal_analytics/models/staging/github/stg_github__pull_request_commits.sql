with

pr_commits as (

    select * from analytics_dev.dbt_jstein.base__github_pull_request_commits

),

pr as (

    select * from analytics_dev.dbt_jstein.stg_github__pull_requests

),

commits as (

    select * from analytics_dev.dbt_jstein.stg_github__commits

),

joined as (

    select
        pr_commits.*,
        pr.issue_id,
        commits.author_email,
        commits.author_name,
        commits.author_date

    from pr_commits
    left join pr using (pull_request_id)
    left join commits using (commit_sha)

)

select * from joined