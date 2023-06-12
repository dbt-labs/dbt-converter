with

google_form as (
    
    select * from {{ ref('stg_googlesheets__global_training_nps') }}
    
),

typeform as (
    
    select * from {{ ref('stg_googlesheets__global_training_feedback') }}
    
),

unioned as (

    select
        *,
        'Google Forms' as survey_platform
    from google_form

    union
    
    select
        *,
        'Typeform' as survey_platform
    from typeform
),

categorized as (


    select

        *,
        {{ segment_nps_score('how_likely_to_recommend_rating') }} as nps_category
    
    from unioned

)

select * from categorized