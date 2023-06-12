with

issue_histories as (

    select * from {{ ref('stg_jira__issue_field_histories') }}

),

issues as (

    select * from {{ ref('stg_jira__issues') }}

),

issues_statuses as (

    select * from issue_histories
    where field_name = 'Status'

),

issue_field_security as (

    select
        issue_id,
        min(updated_at) as severity_security_start_at

    from issue_histories
    where field_name in ('Severity (Security Related)')
    and field_value is not null
    group by 1

),

joined as (

    select
        issues_statuses.*,
        issues.is_resolved,
        issues.resolved_at,
        issue_field_security.severity_security_start_at,
        issues_statuses.updated_at >= severity_security_start_at as is_event_after_security_alert

    from issues_statuses
    left join issues using (issue_id)
    left join issue_field_security using (issue_id)

),

enriched as (

    select
        issue_id,
        is_resolved,
        field_value as status_name,
        severity_security_start_at,
        updated_at as valid_starting_at,
        resolved_at,

        lead(updated_at) over (
            partition by issue_id
            order by updated_at
        ) as valid_ending_at,

    --because "completed" status names vary across Teams,
    --if the ticket is resolved, then null the ending date
        case
            when is_resolved
                and row_number() over (
                    partition by issue_id
                    order by updated_at desc) = 1
                then null
            else datediff(
                    'day',
                    valid_starting_at,
                    coalesce(valid_ending_at, current_date()))
        end as days_in_event,

        is_first_field_value as is_first_status_event,
        is_latest_field_value as is_last_status_event,

        --This creates a flag for the first event after a ticket is marked
        --as being security-critical. This is used in the BI layer for Security SLAs.
        --A ticket can exist on a "To-Do", but we want to mark activity
        --after a ticket becomes security-critical. In addition, there are some tickets
        --that were marked as security-critical after they were resolved (when we first
        --implemented this in December 2021). We want to remove those from this flag.
        case
            when is_event_after_security_alert
                and severity_security_start_at < resolved_at
                and row_number() over (
                    partition by issue_id, is_event_after_security_alert
                    order by updated_at) = 1
                then true
            else false
        end as is_first_event_after_security_alert

    from joined

),

with_id as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'issue_id',
            'status_name',
            'valid_starting_at'
        ])}} as id,
        *

    from enriched

)

select * from with_id