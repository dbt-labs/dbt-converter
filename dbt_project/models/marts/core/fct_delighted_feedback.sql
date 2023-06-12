with

delighted_responses as (

    select * from {{ ref('stg_delighted__responses') }}

),

categorize as (

    select
        *,
        case
            when survey_type != 'nps' then null
            when score < 7 then 'detractor'
            when score between 7 and 8 then 'passive'
            when score > 8 then 'promoter'
        end as nps_category,

        lag(score) over (
            partition by delighted_user_id, feedback_source
            order by created_at
        ) as previous_score,

        previous_score > score as is_lower,
        previous_score = score as is_even,
        previous_score < score as is_higher

    from delighted_responses

)

select * from categorize
