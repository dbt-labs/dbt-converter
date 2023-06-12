with

transactions as (

    select * from {{ ref('fct_cloud_subscription_transactions') }}

),


classifications as (
    
    select 
        id,
        
        date_trunc('month',case
            when date_day <= '2021-01-31'
                then '2021-01-31'
            else date_day
        end) as close_month,

        case
            when lower(change_category) = 'churn'
                then arr_change
            else null
        end as churned_arr,
        
        case
            when lower(change_category) = 'downgrade'
                then arr_change
            else null
        end as downgrade_arr,
        
        case
            when lower(change_category) = 'new'
                then arr_change
            when lower(change_category) = 'reactivation'
                then arr_change
            else null
        end as total_new_arr,
        
        case 
            when lower(change_category) = 'reactivation'
                then arr_change
            else null
        end as reactivation_arr,
        
        case
            when lower(change_category) = 'upgrade'
                then arr_change
            else null
        end as upgrade_arr
    
    from transactions
    where lower(sales_motion) = 'self-service'

)


,synthesized as (
    
    select 
        close_month,
        sum(churned_arr) as churned_arr,
        sum(downgrade_arr) as downgrade_arr,
        sum(total_new_arr) as total_new_arr,
        sum(reactivation_arr) as reactivation_arr,
        sum(upgrade_arr) as upgrade_arr,
        'Self-Serve' as sales_channel

    from classifications
    group by 1

),

export as (

    select
        *,
        total_new_arr + upgrade_arr + reactivation_arr as gross_arr

    from synthesized

)

select * from export