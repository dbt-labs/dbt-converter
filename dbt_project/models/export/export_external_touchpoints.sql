with

slack_users as (

    select * from {{ ref('dim_slack_users') }}
    where email is not null

),

learn_enrollments as (

    select * from {{ ref('fct_training_enrollments') }}
    where user_email is not null
        and started_at is not null

),

unioned as (

    select
        user_id as id,
        email,
        'Joined dbt Slack' as touchpoint_source,
        'dbt Community Slack' as touchpoint_source_detail,
        joined_at as opened_at
    
    from slack_users

    union all 

    select
        enrollment_id as id,
        user_email as email,
        'Enrolled in dbt Learn' as touchpoint_source,
        learning_channel || '_' || course_name as touchpoint_source_detail,
        started_at as opened_at
    
    from learn_enrollments

)

select * from unioned