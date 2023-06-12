with

issues as (

    select * from {{ ref('stg_jira__issues') }}

),

issue_types as (

    select * from {{ ref('stg_jira__issue_types') }}
 
),

epics as (

    select * from {{ ref('stg_jira__epics') }}

),

statuses as (

    select * from {{ ref('stg_jira__statuses') }}

),

resolutions as (

    select * from {{ ref('stg_jira__resolutions') }}

),

users as (

    select * from {{ ref('stg_jira__users') }}

),

issue_field_labels as (

    select * from {{ ref('stg_jira__issue_labels') }}

),

status_events as (

    select * from {{ ref('fct_jira_issue_status_events') }}

),


issue_labels_agg as (

    select
        issue_id,
        listagg(label_name, ', ') within group (order by updated_at) as issue_labels
    from issue_field_labels
    group by 1

),

security_prioritization as (

    select 
        issue_id,

        --if this is a security-critical ticket and it has been resolved
        --then it has been prioritized (this is mainly when we mark a ticket
        --as security-related after it was resolved for historical reasons)
        --for everything else, then use the event after it was marked as 
        --security-critical
        max(case
                when is_resolved
                    then true
                else is_first_event_after_security_alert
        end) as is_security_prioritized,

        --if this is a security-critical ticket, then use the timestamp for when
        --it was first moved statuses after it was marked a security critical.
        --if it was resolved before it was securioty-critical (re: above)
        --then use the resolved_at timestamp.
        max(case
                when is_first_event_after_security_alert
                    then valid_starting_at
                when resolved_at < severity_security_start_at 
                    then resolved_at
        end) as security_prioritized_at

    from status_events
    where severity_security_start_at is not null
    group by 1

),

issues_joined as (

    select
        issues.*,
        
        issue_types.issue_type_name,
        issue_types.is_subtask,
        issue_types.issue_type_description,

        epic_id is not null as is_epic,

        reporter.user_display_name as reporter_name,
        creator.user_display_name as creator_name,
        assignee.user_display_name as assignee_name,

        issue_labels_agg.issue_labels,

        security_prioritization.is_security_prioritized,
        security_prioritization.security_prioritized_at,

        statuses.status_name,
        statuses.status_category_name,
        statuses.status_description,

        resolutions.resolution_name,
        resolutions.resolution_description


    from issues
    left join issue_types using (issue_type_id)
    left join statuses using (status_id)
    left join resolutions using (resolution_id)
    left join issue_labels_agg using (issue_id)
    left join security_prioritization using (issue_id)
    left join epics
        on issues.issue_id = epics.epic_id
    left join users as reporter
        on issues.reporter_user_id = reporter.user_id
    left join users as creator
        on issues.creator_user_id = creator.user_id
    left join users as assignee
        on issues.assignee_user_id = assignee.user_id

)

select * from issues_joined