with 

admins as (
    
    select * from {{ref('base__intercom_admins')}}

),

admins_categorized as (
    
    select * from {{ ref('stg_intercom_user_map') }}
    
),

joined as (
    
    select
        admins.*,
        coalesce(
            admins_categorized.category, 
            'Uncategorized'
        ) as assignee_group

    from admins     
    left join admins_categorized
        on admins.admin_id = admins_categorized.admin_id

)

select * from joined 