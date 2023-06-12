with 

questions as (

    select * from {{ ref('base__delighted_questions') }}
),

responses as (

    select 
        question_id,
        response_id,
        free_response
    from {{ ref('base__delighted_response_answers') }}
),

responses_w_questions as (

    select
        responses.response_id,
        questions.feedback_source,
        questions.question_text_snake_case,
        responses.free_response
    from responses
    left join questions
        on responses.question_id = questions.question_id
),

pivoted as (
    select
        response_id,
        feedback_source,
        {{ dbt_utils.pivot(
            'question_text_snake_case',
            dbt_utils.get_column_values(
                ref('base__delighted_questions'), 'question_text_snake_case'),
            then_value='free_response',
            else_value='null',
            agg='max'
        ) }}

    from responses_w_questions
    group by 1,2
)

select * from pivoted

