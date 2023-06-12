

with

ticket_tailor as (

    select * from analytics_dev.dbt_jstein.stg_ticket_tailor__tickets

),

thinkific as (

    select * from analytics_dev.dbt_jstein.stg_thinkific__enrollments

),

private as (

    select * from analytics_dev.dbt_jstein.stg_googlesheets__private_learn_enrollments

),

ticket_tailor_renamed as (

    select
        ticket_id as enrollment_id,
        event_id as course_id,
        'community learn' as learning_channel,
        full_name as user_name,
        ticket_holder_email as user_email,
        domain as user_email_domain,
        event_name as course_name,
        'public' as course_type,
        percentage_completed,
        true as is_fundamentals_course,
        false as is_fundamentals_quiz,
        is_completed,
        (is_fundamentals_course and is_completed) as is_trained,
        started_at,
        completed_at,
        completed_at::date as completed_date,
        null::timestamp as last_logged_in_at

    from ticket_tailor
    where
        is_learn_event = true
        and status = 'valid'
        and is_fishtown_employee = false

),

thinkific_renamed as (

    select
        enrollment_id,
        course_id,
        case
            when course_name ilike '%jumpstart%' then 'jumpstart'
            when course_name ilike '%onboarding%' then 'rapid onboarding'
            else 'on demand' 
        end as learning_channel,
        user_name,
        user_email,
        user_email_domain,
        course_name,
        course_type,
        percentage_completed,
        case
            when course_name ilike any ('%jumpstart%','%fundamentals%','%rapid onboarding%')
                then true
            else false
        end as is_fundamentals_course,
        course_name ilike '%quiz%' as is_fundamentals_quiz,
        is_completed,
        (is_fundamentals_course and is_completed) as is_trained,
        started_at,
        completed_at,
        completed_at::date as completed_date,
        last_logged_in_at

    from thinkific
    where
        is_fishtown_employee = false
        and is_internal_course = false

),

private_renamed as (

    select
        id as enrollment_id,
        course_name as course_id,
        'group training' as learning_channel,
        full_name as user_name,
        email as user_email,
        email_domain as user_email_domain,
        course_name,
        'private' as course_type,
        1 as percentage_completed,
        true as is_fundamentals_course,
        false as is_fundamentals_quiz,
        is_completed,
        (is_fundamentals_course and is_completed) as is_trained,
        start_date as started_at,
        end_date as completed_at,
        completed_at::date as completed_date,
        null::timestamp as last_logged_in_at

    from private

),

unioned as (

    select * from ticket_tailor_renamed

    union all

    select * from thinkific_renamed

    union all

    select * from private_renamed

)

select * from unioned