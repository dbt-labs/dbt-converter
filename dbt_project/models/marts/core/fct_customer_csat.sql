with

delighted_responses as (

    select * from {{ ref('stg_delighted__responses') }}
    where survey_type in ('csat','stars_five')

),

delighted_users as (

    select * from {{ ref('stg_delighted__users') }}
),

final as (

    select 
        delighted_responses.*,
        delighted_users.name, 
        delighted_users.email ,
        delighted_users.user_created_at
    
    from delighted_responses
    left join delighted_users
        on delighted_responses.delighted_user_id = delighted_users.delighted_user_id

)

select * from final
