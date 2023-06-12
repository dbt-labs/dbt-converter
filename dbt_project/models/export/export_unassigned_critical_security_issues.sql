with

jira_issues as (

    select * from {{ ref('fct_jira_issues') }}
    where status_name not in ('Closed', 'Done')
    and assignee_name is null

),

jira_field_values as (

    select * from {{ ref('fct_jira_issue_field_values') }}
    where current_security_severity_level = 'Critical'

),

jira_boards as (

    select * from {{ ref('stg_jira__boards') }}

),

jira_issue_boards as (

    select * from {{ ref('stg_jira__issue_boards') }}

),

jira_project_boards as (

    select * from {{ ref('stg_jira__project_boards') }}

),

issues_enriched as (

    select
        jira_issues.*,
        jira_field_values.severity_security_start_at,
       case
            when current_security_severity_level is not null
               and not is_security_prioritized
                    then datediff('day', severity_security_start_at, current_date())
            when current_security_severity_level is not null
                and is_security_prioritized
                    then datediff('day', severity_security_start_at, security_prioritized_at)
        end as total_days_from_security_to_prioritized

    from jira_issues
    inner join jira_field_values using (issue_id)

),

issue_projects as (

    select distinct 
            --sometimes an issue can live in a single
            -- project but live in multiple boards
            -- (e.g. issue_id = 13310)
        jira_issue_boards.issue_id,
        jira_project_boards.project_key,
        jira_project_boards.project_name

    from jira_issue_boards
    left join jira_boards using (board_id)
    left join jira_project_boards using (board_id)

),

joined as (

    select
        issues_enriched.issue_id,
        issue_projects.project_key,
        issue_projects.project_name,
        issues_enriched.issue_key,

        issues_enriched.assignee_name,
        issues_enriched.creator_name,

        issues_enriched.issue_name,
        issues_enriched.issue_type_name,

        issues_enriched.priority,
        issues_enriched.reporter_name,
        issues_enriched.status_name,
        issues_enriched.created_at,
        issues_enriched.severity_security_start_at,
        issues_enriched.due_date,
        issues_enriched.issue_labels,
        issues_enriched.total_days_from_security_to_prioritized

    from issues_enriched
    left join issue_projects using (issue_id)

)

select * from joined