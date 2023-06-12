with

source as (

    --this unions delighted projects together. when you add to this, update
    --the delighted_source_categorization macro to categorize correctly!

    {{ dbt_utils.union_relations(
        relations=[
            source('delighted_thinkific_nps', 'question'),
            source('delighted_proserv_csat', 'question')
        ],
        source_column_name="feedback_source"
    ) }}

),

renamed as (

    select
    
        id as question_id,
        text as question_text,
        lower(replace(replace(text, ' ', '_'), '?', '')) 
            as question_text_snake_case,
        case
            when feedback_source like '%thinkific_nps%' then 'thinkific_nps'
            when feedback_source like '%proserv_csat%' then 'proserv_csat'
            else 'other'
        end
            as feedback_source,
        type

    from source

)

select * from renamed