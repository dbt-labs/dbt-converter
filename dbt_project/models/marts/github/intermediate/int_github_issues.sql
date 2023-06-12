with

issues as (

    select * from {{ ref('stg_github__issues') }}

),

issue_label_history as (

    select * from {{ ref('int_issue_label_history') }}

),

repository as (

    select * from {{ ref('stg_github__repositories') }}

),

triage_values as (

    select
        issue_id,
        min(
            case
                when is_triage_label
                then start_at
            end
        ) as first_marked_for_triage_at,
        max(
            case
                when is_triage_label
                then start_at
            end
        ) as last_marked_for_triage_at,
        coalesce(count(
            case
                when is_triage_label
                 and start_at is not null
                then issue_label_history_id
            end
        ), 0) as marked_for_triage_count,
        min(
            case
                when is_review_label
                then start_at
            end
        ) as first_marked_for_review_at,
        min(
            case
                when is_triage_label
                then end_at
            end
        ) as first_triaged_at,
        max(
            case
                when is_triage_label
                then end_at
            end
        ) as last_triaged_at,
        coalesce(count(
            case
                when is_triage_label
                 and end_at is not null
                then issue_label_history_id
            end
        ), 0) as triage_count,
        min(
            case
                when is_team_label
                then start_at
            end
        ) as first_assigned_to_team_at,
        max(
            case
                when is_team_label
                then start_at
            end
        ) as last_assigned_to_team_at,
        coalesce(count(
            case
                when is_team_label
                then issue_label_history_id
            end
        ), 0) as assigned_to_team_count,
        min(
            case
                when is_merge_failure_label
                then start_at
            end
        ) as first_merge_failure_at,
        max(
            case
                when is_merge_failure_label
                then start_at
            end
        ) as last_merge_failure_at
        

    from issue_label_history
    group by 1

),

team_label as (

    select
        issue_id,
        team
    
    from issue_label_history
    where is_team_label
      and end_at is null
    qualify row_number() over (
        partition by issue_id
        order by start_at desc
    ) = 1

),

joined as (

    select
        {{ dbt_utils.star(
            from=ref('stg_github__issues'),
            relation_alias='issues'
        ) }},
        pull_request_number as issue_number,
        repository.repo_name,
        triage_values.first_marked_for_triage_at,
        triage_values.last_marked_for_triage_at,
        triage_values.marked_for_triage_count,
        triage_values.first_marked_for_review_at,
        triage_values.first_triaged_at,
        triage_values.last_triaged_at,
        triage_values.triage_count,
        triage_values.first_assigned_to_team_at,
        triage_values.last_assigned_to_team_at,
        triage_values.assigned_to_team_count,

        triage_values.first_merge_failure_at,
        triage_values.last_merge_failure_at,

        case
            when repo_name = 'dbt-core' then 'core - ' || coalesce(team_label.team, 'no subteam')
            when repo_name in ('dbt-redshift', 'dbt-snowflake', 'dbt-bigquery', 'dbt-spark') then 'core - adapters'
            when repo_name in ('dbt-rpc', 'homebrew-dbt') then 'core - execution'
            when repo_name in ('dbt-docs') then 'core - language'
            else team_label.team
        end as team,
        'https://github.com/dbt-labs/'
          || repository.repo_name || '/'
          || case when is_pull_request then 'pull' else 'issues' end || '/'
          || pull_request_number as github_url

    from issues

    left join triage_values
        on issues.issue_id = triage_values.issue_id
    left join repository
        on issues.repository_id = repository.repository_id
    left join team_label
        on issues.issue_id = team_label.issue_id

)

select * from joined
