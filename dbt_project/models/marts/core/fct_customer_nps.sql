with

delighted_responses as (

    select * from {{ ref('stg_delighted__responses') }}
    where survey_type = 'nps'

),

delighted_users as (

     select * from {{ ref('stg_delighted__users') }}
),

global_training_responses as (
    
    select * from {{ ref('fct_global_training_nps') }}
    
),

country_remapping as (

    select * from {{ ref('stg_seed__delighted_country_remapping') }}

),

delighted_users_responses_joined as (

    select 
        delighted_responses.* exclude (country),
        coalesce(country_remapping.corrected_country_name, delighted_responses.country) as country,
        delighted_users.name, 
        delighted_users.email ,
        delighted_users.user_created_at

    from delighted_responses
    left join delighted_users
        on delighted_responses.delighted_user_id = delighted_users.delighted_user_id
    left join country_remapping
        on delighted_responses.country = country_remapping.original_country_name

),

unioned as (
    
    select
    
        {{  dbt_utils.generate_surrogate_key(['response_id']) }} as unique_id,
        delighted_user_id,
        null as visitor_id,
        feedback_source,
        survey_type,
        score,
        comment,
        created_at,
        updated_at,
        _fivetran_synced,
        dbt_cloud_user_id,
        dbt_cloud_account_id,
        tenant_dbt_cloud_user_id,
        tenant_dbt_cloud_account_id,
        tenant_id,
        global_user_id,
        global_account_id,
        name,
        email,
        environment_name,
        account_plan,
        account_plan_tier,
        is_multi_tenant,
        user_license_type,
        country,
        survey_source,
        'Delighted' as survey_platform,
        survey_page_url,
        referrer_url,
        survey_page,
        device_type,
        browser,
        operating_system,
        visitor_type,
        browser_timezone,
        zendesk_ticket_id,
        user_created_at,
        {{ segment_nps_score('score') }} as nps_category,
        -- take `survey_page_url` and derive the course the customer was taking when prompted for NPS
        case 
            when feedback_source = 'thinkific_nps' then 
                case
                    -- if actively taking a course (in a section), they have a URL with '/take/'
                    when split_part(survey_page_url, '/', 5) = 'take' 
                        then split_part(survey_page_url, '/', 6)
                    
                    -- on a course, but not in a section
                    when split_part(survey_page_url, '/', 5) is null or split_part(survey_page_url, '/', 5) = ''
                        then split_part(replace(split_part(survey_page_url, '/', 4),'#', ''), '?', 1)
                    
                    -- sometimes on other pages, ie. collections or certificates
                    else split_part(split_part(survey_page_url, '/', 5), '#', 1)
                end
            else null
        end as thinkific_survey_course_derived
    
    from delighted_users_responses_joined

    union
    
    select
    
        unique_id,
        
        null as delighted_user_id,
        null as visitor_id,
        case
            when training_type ilike '%rapid%'
                then 'rapid_onboarding_nps'
            when training_type ilike '%group%'
                then 'group_training_nps'
        end as feedback_source,
        'nps' as survey_type,
        how_likely_to_recommend_rating as score,
        how_likely_to_recommend_text as comment,
        submitted_at as created_at,
        null as updated_at,
        null as _fivetran_synced,
        null as dbt_cloud_user_id,
        null as dbt_cloud_account_id,
        null as tenant_dbt_cloud_user_id,
        null as tenant_dbt_cloud_account_id,
        null as tenant_id,
        null as global_user_id,
        null as global_account_id,
        submitted_by_name as name,
        submitted_by_email as email,
        null as environment_name,
        null as account_plan,
        null as account_plan_tier,
        null as is_multi_tenant,
        null as user_license_type,
        null as country,
        'nps_googlesheet' as survey_source,
        survey_platform,
        null as survey_page_url,
        null as referrer_url,
        null as survey_page,
        null as device_type,
        null as browser,
        null as operating_system,
        null as visitor_type,
        null as browser_timezone,
        null as zendesk_ticket_id,
        null as user_created_at,
        nps_category,
        null as thinkific_survey_course_derived
        
    from global_training_responses
    
)

select * from unioned