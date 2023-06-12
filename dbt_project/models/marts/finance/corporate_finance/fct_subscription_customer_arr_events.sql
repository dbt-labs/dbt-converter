with 

movements as (

    select * from {{ ref('int__subscription_customer_arr_delta') }}

),


arr_balance as (

    select * from {{ ref('int__subscription_customer_arr_balance') }}

),


unioned as (

    select * from movements

        union all

    select * from arr_balance

),


final as (

    select 

        {{ dbt_utils.generate_surrogate_key([
            'close_month',
            'customer_id',
            'sales_channel',
            'metric_category',
            'metric'
        ]) }} as id,

        close_month,

        coalesce(
            close_month = date_trunc('month',current_date),
            false
        ) as is_current_month,

        coalesce(
            close_month = dateadd('month',1,date_trunc('month',current_date)),
            false
        ) as is_next_month,

        coalesce(
            date_part('month',close_month) in (1,4,7,10),
            false
        ) as is_end_of_quarter, 

        customer_id,
        customer_name,
        sales_channel,
        metric_category,
        metric,
        metric_value
    from unioned

)

select * from final