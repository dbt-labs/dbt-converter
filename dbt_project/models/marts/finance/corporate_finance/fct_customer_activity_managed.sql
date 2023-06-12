with 

time_periods as ( -- get quarter definitions

    select * from {{ref('all_days')}}

),

opps as (

    select * from {{ref('fct_opportunities')}}
    where customer_id != '0014v00002OxoX7AAJ' --dbt Labs

),

{%- set columns = ['land', 'churn','expand','downsell','renew','expected_churn','expected_downsell','up_for_expansion','up_for_renewal','open_pipeline'] -%}

unioned as (

{% for column in columns %}

    select 
        close_date,
        '{{ column | replace("_", " ") | capitalize }}' as type,
        customer_id,
        account_name as customer_name,
        expected_arr_delta
    from opps
    where is_customer_movement_{{column}} = true

    {% if not loop.last %}
    union 
    {%- endif -%}
    
{% endfor %}

),

joined as (

    select 
        time_periods.fiscal_quarter,
        time_periods.fiscal_year,
        unioned.close_date,
        date_trunc('month',unioned.close_date) as close_month,
        'Managed' as sales_channel,
        unioned.customer_id,
        unioned.customer_name,
        unioned.type as customer_activity_type,
        unioned.expected_arr_delta,
        rank() over (partition by customer_id, customer_activity_type, close_month order by close_date desc) as idx
    from unioned
    left join time_periods
        on unioned.close_date = time_periods.date_day
    qualify idx = 1

),

final as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'close_month',
            'customer_id',
            'customer_activity_type',
            'expected_arr_delta'
        ]) }} as customer_activity_id,
        fiscal_quarter,
        fiscal_year,
        close_month,
        sales_channel,
        customer_id,
        customer_name,
        customer_activity_type,
        expected_arr_delta

    from joined

)

select * from final
