with

base as (

    select * from {{ ref('fct_subscription_customer_arr_events') }}

),

calcs as (
        
    select 

        close_month,
        is_current_month,
        is_next_month,
        is_end_of_quarter,
        customer_id,
        customer_name,
        sales_channel,

        
        sum(case 
            when metric = 'beginning_arr'
                then metric_value
            else null
        end) as starting_arr,

        sum(case 
            when metric = 'new'
                then metric_value
            else null
        end) as new_arr,

        sum(case 
            when metric = 'upgrade'
                then metric_value
            else null
        end) as upgrade_arr,

        sum(case 
            when metric = 'reactivation'
                then metric_value
            else null
        end) as reactivation_arr,

        sum(case 
            when metric = 'mg_ent_upgrade'
                then metric_value
            else null
        end) as ent_upgrade_mg,

        sum(case 
            when metric = 'mg_ent_starting'
                then metric_value
            else null
        end) as mg_ent_starting,

        sum(case
            when metric in ('new','upgrade','reactivation','mg_ent_upgrade','mg_ent_starting')
                then metric_value
            else null
        end) as gross_arr_total,

        sum(case 
            when metric = 'downgrade'
                then metric_value
            else null
        end) as downgrade_arr,

        sum(case 
            when metric = 'churn'
                then metric_value
            else null
        end) as lost_arr,

        sum(case 
            when metric = 'ss_ent_upgrade'
                then metric_value
            else null
        end) as ent_upgrade_ss,

        sum(case 
            when metric in ('downgrade','churn','ss_ent_upgrade')
                then metric_value
            else null
        end) as churn_arr_total,

        sum(case 
            when metric = 'ending_arr'
                then metric_value
            else null
        end) as ending_arr

    from base

    {{dbt_utils.group_by(7)}}

),

synth as (

    select

        close_month,
        is_current_month,
        is_next_month,
        is_end_of_quarter,
        customer_id,
        customer_name,
        sales_channel,
        starting_arr,
        new_arr,
        upgrade_arr,
        reactivation_arr,
        ent_upgrade_mg,
        mg_ent_starting,
        gross_arr_total,
        downgrade_arr,
        lost_arr,
        ent_upgrade_ss,
        churn_arr_total,
        
        case
            when is_next_month = true
                then null

            when sales_channel = 'Managed'
                then ending_arr

            when sales_channel = 'Self-Serve'
            and ifnull(ending_arr,0) = 0
            and abs(ifnull(ent_upgrade_ss,0)) > 0
                then null

            when sales_channel = 'Self-Serve'
            and ifnull(ending_arr,0) = 0
            and abs(ifnull(ent_upgrade_ss,0)) = 0
                then 0
            
            else ending_arr

        end as ending_arr,

        case
            when is_next_month = true
                then 0
            else
                round(coalesce(ending_arr,0)
                - (coalesce(starting_arr,0)
                + coalesce(new_arr,0)
                + coalesce(upgrade_arr,0)
                + coalesce(reactivation_arr,0)
                + coalesce(downgrade_arr,0)
                + coalesce(lost_arr,0)
                + coalesce(ent_upgrade_mg,0)
                + coalesce(ent_upgrade_ss,0)
                + coalesce(mg_ent_starting,0)),0)
            end  as walk_delta

    from calcs

)

select * from synth