with

issue_label_history as (

    select * from {{ ref('stg_github__issue_label_history') }}

),

start_values as (

    select
        issue_label_history_id,
        issue_id,
        label_id,
        label_name,
        is_triage_label,
        is_review_label,
        is_merge_failure_label,
        is_team_label,
        team,
        actor_id as created_actor_id,
        updated_at as start_at

    from issue_label_history
    where is_labeled

),

final as (

    select
        start_values.*,
        issue_label_history.actor_id as removed_actor_id,
        issue_label_history.updated_at as end_at
    
    from start_values
    left join issue_label_history
        on start_values.issue_id = issue_label_history.issue_id
        and start_values.label_name = issue_label_history.label_name
        and start_values.start_at <= issue_label_history.updated_at
        and not issue_label_history.is_labeled
    
    qualify row_number() over (
        partition by 
            start_values.issue_label_history_id
        order by
            issue_label_history.updated_at
    ) = 1

)

select * from final