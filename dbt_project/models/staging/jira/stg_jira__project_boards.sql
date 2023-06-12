{{
  config(
    materialized = 'table'
  )
}}

with

project_boards as (

    select * from {{ ref('base__jira_project_boards') }}

),

projects as (

    select * from {{ ref('stg_jira__projects') }}

),

boards as (

    select * from {{ ref('stg_jira__boards') }}

),

joined as (

    select
        project_boards.project_board_id,

        project_boards.project_id,
        projects.project_key,
        projects.project_lead_user_id,
        projects.project_category_id,

        projects.project_name,
        projects.project_description,

        project_boards.board_id,
        boards.board_name,
        boards.board_type

    from project_boards
    left join projects using (project_id)
    left join boards using (board_id)

)

select * from joined
