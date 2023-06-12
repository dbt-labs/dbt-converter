with

source as (

    select * from raw.fivetran_jira.issue

),

renamed as (

    select
        id as issue_id,
        issue_type as issue_type_id,
        key as issue_key,
        parent_id as parent_issue_id,

        project as project_id,

        reporter as reporter_user_id,
        creator as creator_user_id,
        assignee as assignee_user_id,

        priority as priority_id,
        status as status_id,
        resolution as resolution_id,

        summary as issue_name,
        description as issue_description,
        environment,
        work_ratio,
        priority,
        security_level,

        coalesce(original_estimate, _original_estimate) as original_estimate_seconds,
        coalesce(remaining_estimate, _remaining_estimate) as remaining_estimate_seconds,
        coalesce(time_spent, _time_spent) as time_spent_seconds,

        resolved is not null as is_resolved,
        _fivetran_deleted as is_deleted,
        created as created_at,
        due_date,
        last_viewed as last_viewed_at,
        status_category_changed as status_changed_at,
        resolved as resolved_at,
        updated as updated_at
        
    from source
)

select * from renamed