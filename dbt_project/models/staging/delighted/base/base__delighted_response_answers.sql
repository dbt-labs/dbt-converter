with

source as (

    --this unions delighted projects together. when you add to this, update
    --the delighted_source_categorization macro to categorize correctly!

    {{ dbt_utils.union_relations(
        relations=[
            source('delighted_thinkific_nps', 'response_answer'),
            source('delighted_proserv_csat', 'response_answer')
        ],
        source_column_name="feedback_source"
    ) }}

),

renamed as (

    select
    
        --ids
        id as response_answer_id,
        question_id,
        response_id,

        free_response

    from source

)

select * from renamed