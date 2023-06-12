with

issues as (

    select * from {{ ref('int_github_issues') }}
    where is_pull_request = true

),

pull_requests as (

    select * from {{ ref('stg_github__pull_requests') }}

),

commits as (

    select * from {{ ref('stg_github__commits') }}

),

commits_with_pull_requests as (

    select * from {{ ref('stg_github__pull_request_commits') }}

),

merged_issues as (

    select * from {{ ref('stg_github__issues_merged') }}

),

users as (

-- pulling from int table to send PR data back into user data
    select * from {{ ref('int_github_users_prep') }}

),

repository as (

    select * from {{ ref('stg_github__repositories') }}

),

computed_dates as (

    select
        issue_id,
        min(author_date) as first_commit_date

    from commits_with_pull_requests
    group by 1

),

reviews as (
  
    select * from {{ ref('stg_github__pull_request_reviews') }}
  
),

first_review as (
  
    select
    
        pull_request_id,
        min(reviews.submitted_at) as first_reviewed_at
    
    from reviews
    left join users
        on reviews.user_id = users.user_id
    -- first review from an engineer (PM reviews don't count)
    where users.engineering_team_assignment is not null
    group by 1
    
),

joined as (

    select
        {{ dbt_utils.star(
            from=ref('int_github_issues'),
            except=[
                'issue_number',
                'first_marked_for_triage_at',
                'last_marked_for_triage_at',
                'marked_for_triage_count',
                'first_triaged_at',
                'last_triaged_at',
                'triage_count'
            ],
            relation_alias='issues'
        ) }},
        pull_requests.pull_request_id,
        first_review.first_reviewed_at,
        case
            when first_reviewed_at is not null
                then true
            else false
        end as is_reviewed,
        merged_issues.merged_at,
        case
            when merged_at is not null
                then true
            else false
        end as is_merged,
        users.name as user_name,
        users.github_username,
        users.teams as users_team,
        users.engineering_team_assignment as users_engineering_team,
        computed_dates.first_commit_date

    from issues
    left join pull_requests using (issue_id)
    left join merged_issues using (issue_id)
    left join users using (user_id)
    left join repository using (repository_id)
    left join computed_dates using (issue_id)
    left join first_review
        on pull_requests.pull_request_id = first_review.pull_request_id

)

select * from joined