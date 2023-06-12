with

task_events as (

    select * from {{ ref('stg_asana__task_events') }}

),

project_tasks as (

    select * from {{ ref('fct_asana_project_tasks') }}

),

events_joined as (

    select

        task_events.task_event_id,
        task_events.target_id as task_id,
        task_events.created_by_id as event_created_by_id,
        task_events.text as event_name,
        task_events.type as event_type,
        task_events.created_at as event_timestamp,
                
        project_tasks.project_id,
        project_tasks.project_name,
        project_tasks.team_name,
        project_tasks.assignee_name,
        project_tasks.task_name,
        project_tasks.department,
        project_tasks.current_section_name,
        project_tasks.est_hours,
        project_tasks.start_on,
        project_tasks.due_on,
        project_tasks.completed_at

    from task_events
    left join project_tasks
        on task_events.target_id = project_tasks.task_id

),

with_id as (

    select
        {{dbt_utils.generate_surrogate_key([
            'task_event_id',
            'project_id'
        ])}} as id,
        *

    from events_joined

)

select * from with_id