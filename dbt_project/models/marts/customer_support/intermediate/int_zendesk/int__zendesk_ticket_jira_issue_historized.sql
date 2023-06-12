with recursive updates as (

    select * from {{ ref('int__zendesk_ticket_jira_issue_updates') }}

),

-- create one row per Zendesk ticket Jira update with the full list of associated Jira issues at the time
jira_ticket_states as (

    -- anchor clause: initialize recursive CTE
    select
        ticket_id,
        issue_id,
        updated_at,
        update_type,
        array_construct(issue_id) as jira_issue_ids,
        n_ticket_jira_update
        
    from updates
    where n_ticket_jira_update = 1

    union all

    -- recursive clause: iteration over ticket updates
    select
        updates.ticket_id,
        updates.issue_id,
        updates.updated_at,
        updates.update_type,
        case
            when updates.update_type = 'addition'
                then array_append(jira_ticket_states.jira_issue_ids, updates.issue_id)
            when updates.update_type = 'removal'
                -- array_remove only accept variant types for the value to remove
                then array_remove(jira_ticket_states.jira_issue_ids, updates.issue_id::variant)
        end as jira_issue_ids,
        updates.n_ticket_jira_update
        
    from updates
    inner join jira_ticket_states
        on updates.ticket_id = jira_ticket_states.ticket_id
            and updates.n_ticket_jira_update = jira_ticket_states.n_ticket_jira_update + 1

)

select * from jira_ticket_states