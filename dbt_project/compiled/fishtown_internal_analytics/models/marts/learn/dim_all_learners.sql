



with

enrollments as (

    select * from analytics_dev.dbt_jstein.fct_training_enrollments

),

best_course_percentage as (
-- there are instances where a person is recorded as taking a course more 
-- than once (e.g. Rapid Onboarding). We want to choose the highest percentage for that course
-- so the object_agg function doesn't throw an error with >1 variable for pct completed per course
    select
        *,
        max(percentage_completed) over (
            partition by user_email, course_name
        ) as best_percentage_per_course
    from enrollments

),

-- best_course uses window functions to count the number of courses and determine highest completed course.

best_course as (

    select
        *,
        max(has_fundamentals_badge) over (
            partition by user_email
        ) as has_ever_had_fundamentals_badge,

        max(has_active_badge) over (
            partition by user_email
        ) as has_active_fundamentals_badge,

        count(enrollment_id) over (
            partition by user_email
        ) as total_number_of_courses,

        object_agg(distinct course_name, (best_percentage_per_course*100)::int) over (
            partition by user_email
        ) as attended_courses,

        min(started_at) over (
            partition by user_email
        ) as first_started_at,

        max(last_logged_in_at) over (
            partition by user_email
        ) as lastest_logged_in_at,

        row_number() over (
            partition by user_email
            order by best_percentage_per_course desc, is_trained desc, started_at asc
            -- take the highest completion percentage
            -- if more than 1 are 100%, select the one that counts towards being trained
            -- else, grab earliest start
        ) as highest_completed_course_index

    from best_course_percentage
    qualify highest_completed_course_index = 1
    -- filter applied to choose the course that has the highest completion rate

),

renamed as (

    select
        user_email as learner_email,
        salesforce_contact_id,
        user_name as learner_name,
        user_email_domain as learner_email_domain,

        --course info
        learning_channel as best_learning_channel,
        course_name as best_course_name,
        course_type as best_course_type,
        percentage_completed as best_percentage_completed,
        attended_courses,
        total_number_of_courses,

        is_trained,
        is_partner,
        has_ever_had_fundamentals_badge,
        has_active_fundamentals_badge,
        partner_name,

        first_started_at,
        lastest_logged_in_at as last_logged_in_at,
        completed_at as first_completed_at

    from best_course

)

select * from renamed