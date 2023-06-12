with

fct_arr_waterfall as (

    select * from {{ ref('fct_arr_waterfall') }}
    where
        sales_channel = 'Managed'
        and ent_upgrade_mg > 0

),

all_days as (

    select * from {{ ref('all_days') }}
    where is_first_day_of_month = true

),

joined as (

    select
        all_days.fiscal_year,
        all_days.fiscal_quarter,
        fct_arr_waterfall.sales_channel,
        fct_arr_waterfall.customer_id,
        fct_arr_waterfall.customer_name,
        'Upgrade from Self-Serve' as customer_activity_type
    from fct_arr_waterfall
    inner join all_days
        on fct_arr_waterfall.close_month = all_days.date_day

),

final as (

    select 
        {{ dbt_utils.generate_surrogate_key([
            'fiscal_quarter',
            'customer_id',
            'sales_channel',
            'customer_activity_type'
        ]) }} as quarterly_enterprise_upgrade_id_sk,
        *
    from joined

)

select * from final
