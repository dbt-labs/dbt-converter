with 

transactions as (

    select * from {{ ref('int__subscription_customer_transactions') }}

),


movements as (

    select
        close_month,
        customer_id,
        customer_name,
        sales_channel,
        'arr_delta' as metric_category,
        is_enterprise_upgrade,

        case 
            when change_category = 'S2M'
                then 'ss_ent_upgrade'
            when change_category = 'S2M (managed upgrade)'
                then 'mg_ent_upgrade'
            else change_category
        end as metric,

        sum(case 
            when change_category = 'S2M'
                then arr
            else arr_change
        end) as metric_value,

        sum(case
            when change_category = 'S2M (managed upgrade)'
                then prod_ending_arr - arr_change
            else null
        end) as ent_upgrade_base

    from transactions
    where change_category is not null

    {{ dbt_utils.group_by(7) }}

),


within_channel as (

    select 
        close_month,
        customer_id,
        customer_name,
        sales_channel,
        metric_category,
        metric,
        metric_value
    from movements
    where metric != 'ss_ent_upgrade'

),


enterprise_upgrade_ss as (

    select 
        close_month,
        customer_id,
        customer_name,
        sales_channel,
        metric_category,
        metric,
        metric_value * -1 as metric_value
    from movements
    where metric = 'ss_ent_upgrade'

),


enterprise_upgrade_mg as (

    select 
        close_month,
        customer_id,
        customer_name,
        sales_channel,
        metric_category,
        'mg_ent_starting' as metric,
        ent_upgrade_base as metric_value
    from movements
    where metric = 'mg_ent_upgrade'

),


movements_unioned as (

    select *
    from within_channel

        union all

    select *
    from enterprise_upgrade_ss

        union all

    select *
    from enterprise_upgrade_mg

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

    from movements_unioned

)


select * from final