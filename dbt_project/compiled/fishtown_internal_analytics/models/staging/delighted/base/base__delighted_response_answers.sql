with

source as (

    --this unions delighted projects together. when you add to this, update
    --the delighted_source_categorization macro to categorize correctly!

    

        (
            select
                cast('raw.fivetran_delighted_thinkific_nps.response_answer' as TEXT) as feedback_source,

                

            from raw.fivetran_delighted_thinkific_nps.response_answer

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_delighted_proserv_csat.response_answer' as TEXT) as feedback_source,

                

            from raw.fivetran_delighted_proserv_csat.response_answer

            
        )

        

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