with 

transactions as (

    select * from {{ ref('int__subscription_customer_transactions') }}

),


transactions_synth as (

    select 
        close_month,
        start_month,
        customer_id,
        customer_name,
        sales_channel,
        'arr_balance' as metric_category,
        sum(prod_ending_arr) as arr
    from transactions
    where is_last_day_of_month = true
    {{ dbt_utils.group_by(6) }}

),


ending as (

    select 
        close_month,
        customer_id,
        customer_name,
        sales_channel,
        metric_category,
        'ending_arr' as metric,
        arr
    from transactions_synth

),


beginning as (

    select 
        start_month as close_month,
        customer_id,
        customer_name,
        sales_channel,
        metric_category,
        'beginning_arr' as metric,
        arr
    from transactions_synth
    where arr != 0

),


unioned as (

    select *
    from ending

        union all

    select *
    from beginning

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
        
        *

    from unioned

)


select * from final