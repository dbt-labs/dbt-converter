with

source as (

    --unlike other delighted staging models where we union together data from
    --a variety of sources, responses answers only currently exists for thinkific nps
    select * from raw.fivetran_delighted_thinkific_nps.response_answer

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