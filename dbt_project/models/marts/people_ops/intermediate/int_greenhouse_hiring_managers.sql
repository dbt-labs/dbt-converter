with

hiring_managers as (

    select * from {{ ref('stg_greenhouse__hiring_team') }}
    where role = 'hiring_managers'

),

users as (

    select * from {{ ref('stg_greenhouse__users') }}

),

user_emails as (

    select * from {{ ref('stg_greenhouse__user_emails') }}

),

synth as (

    select 
        hiring_managers.job_hiring_team_member_id,
        hiring_managers.job_id,
        hiring_managers.user_id,
        user_emails.user_email as hiring_manager_email

    from hiring_managers
    left join user_emails
        on hiring_managers.user_id = user_emails.greenhouse_user_id

)

select * from synth