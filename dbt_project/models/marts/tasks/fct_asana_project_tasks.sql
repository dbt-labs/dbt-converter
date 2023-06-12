with

project_tasks as (

    select * from {{ ref('stg_asana__project_tasks') }}

),

tasks as (

    select * from {{ ref('stg_asana__tasks') }}
    where is_deleted = false

),

projects as (

    select * from {{ ref('stg_asana__projects') }}
    where is_deleted = false

),

teams as (

    select * from {{ ref('stg_asana__teams') }}

),

users as (

    select * from {{ ref('stg_asana__users') }}

),

task_sections as (

    select * from {{ ref('stg_asana__task_sections') }}

),

all_project_tasks as (

    select
        project_tasks.project_task_id,
        project_tasks.project_id,
        projects.team_id,
        projects.owner_id,

        teams.team_name,
        projects.project_name,
        project_owners.user_name as project_owner_name,
        project_owners.email as project_owner_email,
        users.user_name as assignee_name,
        delivered_by_1.user_name as delivered_by_1_name,
        delivered_by_2.user_name as delivered_by_2_name,
        delivered_by_3.user_name as delivered_by_3_name,
        projects.current_status,
        task_sections.current_section_name,
        projects.is_template as is_template_project,

        tasks.completed_at <= tasks.due_on as was_completed_on_time,

        tasks.*

    from project_tasks
    inner join projects
        on project_tasks.project_id = projects.project_id
    left join teams
        on projects.team_id = teams.team_id
    inner join tasks
        on project_tasks.task_id = tasks.task_id
    left join users
        on tasks.assignee_id = users.user_id
    left join users as project_owners
        on projects.owner_id = project_owners.user_id
    left join task_sections
        on project_tasks.project_task_id = task_sections.project_task_id
    left join users as delivered_by_1
        on tasks.delivered_by_1_id = delivered_by_1.user_id
    left join users as delivered_by_2
        on tasks.delivered_by_2_id = delivered_by_2.user_id
    left join users as delivered_by_3
        on tasks.delivered_by_3_id = delivered_by_3.user_id

)

select * from all_project_tasks