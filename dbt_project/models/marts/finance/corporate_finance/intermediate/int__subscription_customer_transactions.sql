with 

transactions as (

    select * from {{ ref('fct_cloud_subscription_transactions') }}

),


transactions_augment as (

    select 

        date_trunc('month',date_day) as close_month,

        dateadd('month',1,close_month) as start_month,
        
        case
            when change_category = 'S2M'
            and is_last_day_of_month = true
                then 0
            else arr
        end as prod_ending_arr,

        *

    from transactions 

)


select * from transactions_augment