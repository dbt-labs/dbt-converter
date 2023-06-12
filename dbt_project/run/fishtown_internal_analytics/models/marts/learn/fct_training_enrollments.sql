
  
    

        create or replace transient table analytics_dev.dbt_jstein.fct_training_enrollments  as
        (

with

all_enrollments as (

    select * from analytics_dev.dbt_jstein.int__training_enrollments_unioned

),

mapping_percent_chapter as (

    select 
        *,
        truncate(total_complete / total_lessons, 4) as percent_of_course_completed
    from analytics_dev.dbt_jstein.stg_seed__training_mapping_percent_chapter

),

partners as (

    select * from analytics_dev.dbt_jstein.stg_salesforce__partners

),

salesforce_contacts as (

    select * from analytics_dev.dbt_jstein.stg_salesforce__contacts
    where is_deleted = false 
),

accredible_fundamentals_badges as (
    
    select * from analytics_dev.dbt_jstein.stg_accredible__credentials
    where credential_group_name = 'dbt-fundamentals'

),

calc_last_completed_chapter as (

    select 
        all_enrollments.*,
        mapping_percent_chapter.chapter as last_chapter_completed, -- Note: this calculation makes the assumption that a learner is progressing sequentially through the course, but this is not yet enforced
        mapping_percent_chapter.percent_of_course_completed as percent_last_chapter_completed
    from all_enrollments
    left join mapping_percent_chapter
        on all_enrollments.course_id = mapping_percent_chapter.course_id
        and all_enrollments.percentage_completed >= mapping_percent_chapter.percent_of_course_completed
    qualify row_number() over (partition by all_enrollments.enrollment_id order by mapping_percent_chapter.percent_of_course_completed desc) = 1

),

calc_current_chapter as (

    select 
        calc_last_completed_chapter.*,
        mapping_percent_chapter.chapter as current_chapter, -- Note: this calculation makes the assumption that a learner is progressing sequentially through the course, but this is not yet enforced
        mapping_percent_chapter.percent_of_course_completed as percent_current_chapter
    from calc_last_completed_chapter
    left join mapping_percent_chapter
        on calc_last_completed_chapter.course_id = mapping_percent_chapter.course_id
        and calc_last_completed_chapter.percentage_completed < mapping_percent_chapter.percent_of_course_completed
    qualify row_number() over (partition by calc_last_completed_chapter.enrollment_id order by mapping_percent_chapter.percent_of_course_completed asc) = 1

),

calc_percentage_of_chapter as (
    select
        calc_current_chapter.*,
        truncate((percentage_completed -  coalesce(percent_last_chapter_completed, 0)) / (percent_current_chapter - coalesce(percent_last_chapter_completed, 0)), 4) as percent_of_chapter_completed
    from calc_current_chapter

),

partners_info as (
  --The partners model can have a partner listed more than once depending on
  --the partnership type (e.g. <Company> - Consulting and <Company> - Training)
  --This looks at the oveall company name and the associated domain
    select distinct
        account_name,
        primary_domain

    from partners

),

final as (

    select
        calc_percentage_of_chapter.enrollment_id,
        calc_percentage_of_chapter.course_id,
        calc_percentage_of_chapter.learning_channel,
        calc_percentage_of_chapter.user_name,
        calc_percentage_of_chapter.user_email,
        calc_percentage_of_chapter.user_email_domain,
        calc_percentage_of_chapter.course_name,
        calc_percentage_of_chapter.course_type,
        calc_percentage_of_chapter.percentage_completed,
        calc_percentage_of_chapter.is_fundamentals_course,
        calc_percentage_of_chapter.is_fundamentals_quiz,
        calc_percentage_of_chapter.is_completed,
        calc_percentage_of_chapter.is_trained,
        calc_percentage_of_chapter.started_at,
        calc_percentage_of_chapter.completed_at,
        calc_percentage_of_chapter.completed_date,
        calc_percentage_of_chapter.last_logged_in_at,
        calc_percentage_of_chapter.last_chapter_completed,

        case 
            when calc_percentage_of_chapter.current_chapter is null and calc_percentage_of_chapter.last_chapter_completed is not null
                then 'Completed'
            else calc_percentage_of_chapter.current_chapter
        end as current_chapter,

        calc_percentage_of_chapter.percent_of_chapter_completed,

        case
            when partners_info.account_name is not null
                then true
            else false
        end as is_partner,

        partners_info.account_name as partner_name,

        salesforce_contacts.contact_id as salesforce_contact_id,
        accredible_fundamentals_badges.credential_id is not null as has_fundamentals_badge,
        coalesce(accredible_fundamentals_badges.is_active_certification, false) as has_active_badge,
        accredible_fundamentals_badges.credential_issued_date,
        accredible_fundamentals_badges.credential_expired_date

    from calc_percentage_of_chapter
    left join partners_info
        on calc_percentage_of_chapter.user_email_domain = partners_info.primary_domain
    left join salesforce_contacts
        on calc_percentage_of_chapter.user_email = salesforce_contacts.email
    left join accredible_fundamentals_badges
        on calc_percentage_of_chapter.completed_date = accredible_fundamentals_badges.credential_issued_date
        and calc_percentage_of_chapter.user_email = accredible_fundamentals_badges.recipient_email
        and calc_percentage_of_chapter.is_fundamentals_course

)

select * from final
        );
      
  