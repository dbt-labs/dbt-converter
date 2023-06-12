{{ unpack_notion_databases('89723335-3391-4beb-b5e8-ea731160128d')}}

questionnaire_status_durations as (

    select * from {{ ref('stg_notion__security_questionnaire_timeseries') }}

),

collapse_to_notion_grain as (

    select
        notion_database_row_id as security_questionnaire_id,
                
        name as security_questionnaire_name,
        sfdc_opp as salesforce_opportunity_url,
        
        -- Parse various formats of SFDC URLS
        {{ parse_sfdc_opp_url('sfdc_opp') }} as salesforce_opportunity_id,
        
        estimated_contract_value,
        submitter,
        status,
        questions as count_of_questions,
        questions_on_follow_up as count_of_questions_follow_up,
        name_and_title_of_prospect_point_of_contact,
        prospect_website,
        nda_in_place,
        why_was_file_not_run_thru_loopio,

        case
            when follow_ups_required = 'Yes'
                then true
            else false
        end as was_follow_up_required,

        case
            when run_through_loopio_ = 'Yes'
                then true
            when run_through_loopio_ = 'No'
                then false
        end as was_questionnaire_run_through_loopio,

        created_datetime as created_at,
        completed_date,
        due_date,
        date_follow_up_complete as follow_up_completed_date,

        -- Array columns to retain desired grain of dataset
        {% for col in ['assigned_to', 'deployment_model', 'files__media', 'link'] -%}
            
            array_agg({{ col }}) as {{ col }}{% if not loop.last %},{% endif %}
        
        {%- endfor %}

    from unpack_json
    {{ dbt_utils.group_by(19)}}

),

final as (

    select
        collapse_to_notion_grain.* exclude (files__media, link),
        questionnaire_status_durations.hours_to_completed_status,
        array_cat(files__media, link) as files_and_media

    from collapse_to_notion_grain
    left join questionnaire_status_durations
        on collapse_to_notion_grain.security_questionnaire_id = questionnaire_status_durations.security_questionnaire_id

)

select * from final