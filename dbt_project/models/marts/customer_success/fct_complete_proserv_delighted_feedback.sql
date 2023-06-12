with

feedback as (

    select * from {{ ref('fct_delighted_feedback') }} where feedback_source = 'proserv_csat' 
),

supplement as (

    select * from {{ ref('stg_delighted__supplemental_responses')}}
    where feedback_source = 'proserv_csat'
),

joined as (

    select
        feedback.response_id,
        feedback.delighted_user_id,
        feedback.salesforce_account_id,
        feedback.salesforce_opportunity_line_item_id,
        feedback.score,
        feedback.comment,
        {{ dbt_utils.star( ref('stg_delighted__supplemental_responses'),
            except = ["response_id"],
            relation_alias = 'supplement' ) }},
        feedback.created_at,
        feedback.updated_at
    from feedback 
    left join supplement 
        on feedback.response_id = supplement.response_id
)

select * from joined
