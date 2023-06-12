--*ACTIVE* survey responses from Typeform training survey

with

source as (
    
    select * from raw.fivetran_googlesheets.global_training_feedback
    
),

renamed as (
    
    select
        _row as response_row_id,
    
        -- dims
        _optional_if_you_would_like_to_share_more_about_your_experience_include_your_name_here 
            as submitted_by_name,
        _optional_if_you_would_like_to_share_more_about_your_experience_include_your_email_here 
            as submitted_by_email,
        
        company as submitted_by_org_name,
        
        who_delivered_your_training_ as training_delivered_by_org_name,
        
        pick_a_job_title_that_most_closely_aligns_with_your_current_responsibilities_ as job_title,
        how_long_have_you_been_using_dbt_ as dbt_experience,
        how_long_have_you_been_writing_sql_ as sql_experience,
        what_s_the_name_of_the_course_you_took_ as training_type,
        
        -- responses
        i_will_be_able_to_apply_the_knowledge_and_skills_learned_in_this_training_
            as able_to_apply_training_rating,
        there_was_adequate_time_to_practice_using_dbt_during_this_training_
            as adequate_time_to_practice_rating,
        the_instructors_were_knowledgeable_
            as instructors_were_knowledgeable_rating,
        the_pre_training_communications_were_clear_
            as pre_training_communications_were_clear_rating,         
        how_likely_are_you_to_recommend_this_training_to_a_colleague_in_your_network_
            as how_likely_to_recommend_rating,
        can_you_explain_why_you_gave_this_rating_ 
            as how_likely_to_recommend_text,
        what_part_of_the_training_did_you_find_the_most_valuable_ 
            as most_valuable_part_of_training,
        what_are_your_next_steps_for_using_dbt_ 
            as next_steps,
        how_can_we_make_this_training_better_in_the_future_ 
            as recommended_improvements,
        submitted_at
    
    from source
    
),

with_id as (

    select
        md5(cast(coalesce(cast(response_row_id as TEXT), '') || '-' || coalesce(cast(submitted_by_org_name as TEXT), '') || '-' || coalesce(cast(submitted_at as TEXT), '') as TEXT)) as unique_id,
        *
    
    from renamed

)

select * from with_id