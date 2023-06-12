with

rev as (
    
    select * from {{ ref('stg_services_revenue_goals') }}
    
),

bookings as (

    select * from {{ ref('stg_services_bookings_goals') }}

),

rev_renamed as (

    select

        quarter_start::date as quarter_start,
        ps_goal as ps_goal_revenue,
        training_goal as training_goal_revenue,
        total_goal as total_goal_revenue

    from rev

),

bookings_renamed as (

    select

        quarter_start::date as quarter_start,
        ps_goal as ps_goal_bookings,
        training_goal as training_goal_bookings,
        total_goal as total_goal_bookings

    from bookings

),

joined as (

    select 
    
        rev_renamed.*,
        bookings_renamed.ps_goal_bookings,
        bookings_renamed.training_goal_bookings,
        bookings_renamed.total_goal_bookings 
        
    from rev_renamed
    left join bookings_renamed
        on rev_renamed.quarter_start = bookings_renamed.quarter_start
    
)

select * from joined