with

source as (

    --this unions delighted projects together. when you add to this, update
    --the delighted_source_categorization macro to categorize correctly!

    

        (
            select
                cast('raw.fivetran_delighted_thinkific_nps.question' as TEXT) as feedback_source,

                

            from raw.fivetran_delighted_thinkific_nps.question

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_delighted_proserv_csat.question' as TEXT) as feedback_source,

                

            from raw.fivetran_delighted_proserv_csat.question

            
        )

        

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