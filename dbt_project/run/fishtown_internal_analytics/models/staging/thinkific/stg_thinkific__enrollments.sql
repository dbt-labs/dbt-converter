
  create or replace   view analytics_dev.dbt_jstein.stg_thinkific__enrollments
  
   as (
    with

source as (

    select * from raw.thinkific.enrollments

),

renamed as (

    select

        -- keys
        id::varchar as enrollment_id,
        user_id::varchar as user_id,
        course_id::varchar as course_id,

        -- description
        trim(replace(user_name, '  ', ' ')) as user_name,
        lower(user_email) as user_email,
        case 
            when course_name = 'dbt Fundamentals (deprecated)'
                then 'dbt Fundamentals v1'
            when course_name = 'dbt Fundamentals'
                then 'dbt Fundamentals v2'
            else course_name
        end as course_name,
        split_part(user_email, '@', -1) as user_email_domain,
        case
            when user_email ilike any ('%fishtownanalytics%', '%dbtlabs%')
                then true
            else false
        end as is_fishtown_employee,
        case
            when course_name in (
                'dbt Labs Company Onboarding',
                'EPD Onboarding',
                'Greenhouse Interviewer Dashboard',
                'InciDos and InciDon\'ts',
                'Greenhouse Hiring Manager Training'
            )
                then true
            else false
        end as is_internal_course,

        -- status
        truncate(percentage_completed, 4) as percentage_completed,
        case
            when course_name ilike any ('%onboarding%', '%jumpstart%')
                then true -- marking all enrollments in Onboarding or Jumpstart as complete
            else completed
        end as is_completed,

        -- timestramps
        started_at::timestamp_ntz as started_at,
        updated_at::timestamp_ntz as last_logged_in_at,
        updated_at::timestamp_ntz as updated_at,
        case
            when course_name ilike any ('%onboarding%', '%jumpstart%') 
                then created_at::timestamp_ntz -- marking all enrollments as completed on start_date
            else completed_at::timestamp_ntz
        end as completed_at

        -- meta
        -- _sdc_batched_at,
        -- _sdc_received_at,
        -- _sdc_sequence,
        -- _sdc_table_version

        -- ignored
        -- is_free_trial,
        -- expired as is_expired,
        -- activated_at,
        -- created_at,

    from source

),

final as (

    select
        * exclude user_email,

        -- Align internal emails around dbtlabs domain
        case
            when is_fishtown_employee
                then replace(user_email, '@fishtownanalytics.com', '@dbtlabs.com')
            else user_email
        end as user_email,

        datediff('day', started_at, current_timestamp) as days_since_enrollment,
        datediff('day', started_at, completed_at) as time_to_complete,
        case
            when (is_completed = 'true' and time_to_complete <= 30) then 'true'
            when (is_completed = 'true' and time_to_complete > 30) then 'false'
            when (is_completed = 'false' and days_since_enrollment > 30) then 'false'
            else 'pending'
        end as is_complete_in_30_days,
        -- the only public course right now is dbt Fundamentals, everything else is a Jumpstart
        case
            when course_name ilike any ('%rapid onboarding%', '%jumpstart%')
                then 'private'
            else 'public'
        end as course_type,
        case
            when percentage_completed = 1 then '100%'
            when percentage_completed >= 0.8 then '80 - 99%'
            when percentage_completed >= 0.6 then '60 - 79%'
            when percentage_completed >= 0.4 then '40 - 59%'
            when percentage_completed >= 0.2 then '20 - 39%'
            when percentage_completed > 0 then '0 - 20%'
            else '0%'
        end as completion_band

    from renamed

)

select * from final
  );

