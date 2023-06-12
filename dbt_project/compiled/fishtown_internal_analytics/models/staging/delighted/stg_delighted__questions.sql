with

source as (

    --unlike other delighted staging models where we union together data from
    --a variety of sources, questions only currently exists for thinkific nps
    select * from raw.fivetran_delighted_thinkific_nps.question

),

renamed as (

    select
        --ids
        id as question_id,

        text,
        type

    from source

)

select * from renamed