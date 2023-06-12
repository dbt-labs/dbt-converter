with rep_quotas as (

    select * from {{ ref('stg_salesforce__rep_quota_periods') }}

),

salesforce_users as (

    select * from {{ ref('dim_salesforce_users') }}

),

opportunities as (

    select * from {{ ref('fct_opportunities') }}

),
    
---getting the last month total where not 0 and applying it to future 0 commission periods
quotas_with_previous_month_ranked as (

    select
        sales_person_user_id,
        commission_period_start_date::date as most_recent_total_quota_commission_start_date,
        total_quota as most_recent_total_quota,
        ramping_quota_no_churn_disc as most_recent_ramping_quota_no_churn_disc,
        fully_ramped_quota_no_churn_disc as most_recent_fully_ramped_quota_no_churn_disc
    from rep_quotas
    where total_quota is not null and total_quota <> 0
    qualify row_number() over (
        partition by sales_person_user_id
        order by commission_period_start_date desc
    ) = 1

),


quotas as (

    select
        sales_person_user_id,
        commission_period_start_date::date as commission_period_start_date,
        commission_period_end_date::date as commission_period_end_date,
        sales_person_name,
        sum(coalesce(new_arr_quota,0)) as new_arr_quota,
        sum(coalesce(renewal_quota,0)) as renewal_quota,
        sum(coalesce(total_commissionable_arr,0)) as total_commissionable_arr,
        sum(coalesce(total_delta_arr,0)) as total_delta_arr,
        sum(coalesce(total_opp_commissions,0)) as total_opp_commissions,
        sum(coalesce(total_quota,0)) as total_quota,
        sum(coalesce(fully_ramped_quota_no_churn_disc,0)) as fully_ramped_quota_no_churn_disc,
        sum(coalesce(ramping_quota_no_churn_disc,0)) as ramping_quota_no_churn_disc,
        sum(coalesce(total_rep_delta_arr,0)) as total_rep_delta_arr,
        sum(coalesce(total_services_revenue,0)) as total_services_revenue
    from rep_quotas
    group by 1, 2, 3, 4

),

quotas_with_most_recent_total_quota_joined as (

    select
        quotas.*,
        quotas_with_previous_month_ranked.most_recent_total_quota_commission_start_date,
        quotas_with_previous_month_ranked.most_recent_total_quota,
        quotas_with_previous_month_ranked.most_recent_ramping_quota_no_churn_disc,
        quotas_with_previous_month_ranked.most_recent_fully_ramped_quota_no_churn_disc
    from quotas
    left join quotas_with_previous_month_ranked
        on quotas.sales_person_user_id = quotas_with_previous_month_ranked.sales_person_user_id 

),


grouped_opps_commission as (

    select
        owner_id,
        sum(expected_arr_delta) as expected_arr_delta,
        sum(discover_at_delta_arr) as discover_at_delta_arr,
        sum(delta_arr) as delta_arr,
        sum(end_arr) as end_arr,
        date_trunc('MONTH', close_date) as close_date_commission_period
    from opportunities
    group by 1, 6
    order by close_date_commission_period desc

),

joined_quotas_opps as (

    select 
        quotas_with_most_recent_total_quota_joined.*,
        grouped_opps_commission.*,
        salesforce_users.is_active
    from quotas_with_most_recent_total_quota_joined
    left join grouped_opps_commission
        on quotas_with_most_recent_total_quota_joined.sales_person_user_id = grouped_opps_commission.owner_id 
        and quotas_with_most_recent_total_quota_joined.commission_period_start_date = grouped_opps_commission.close_date_commission_period 
    left join salesforce_users 
        on quotas_with_most_recent_total_quota_joined.sales_person_user_id =  salesforce_users.user_id
    order by commission_period_start_date desc

),


final as (

    select 
        {{ dbt_utils.generate_surrogate_key(['sales_person_user_id', 'commission_period_start_date']) }} as salesperson_commission_id,
        sales_person_user_id,
        sales_person_name,
        commission_period_start_date,
        commission_period_end_date,
        {{ fiscal_half_year('commission_period_start_date') }} as fiscal_half_year_commission_period_start_date,
        case
            when total_quota = 0 and most_recent_total_quota_commission_start_date < commission_period_start_date and is_active
                then most_recent_total_quota
            else total_quota 
        end as total_quota,
        case
            when ramping_quota_no_churn_disc = 0 and most_recent_total_quota_commission_start_date < commission_period_start_date and is_active
                then most_recent_ramping_quota_no_churn_disc
            else ramping_quota_no_churn_disc 
        end as ramping_quota_no_churn_disc,
        case
            when fully_ramped_quota_no_churn_disc = 0 and most_recent_total_quota_commission_start_date < commission_period_start_date and is_active
                then most_recent_fully_ramped_quota_no_churn_disc
            else fully_ramped_quota_no_churn_disc 
        end as fully_ramped_quota_no_churn_disc,  
        new_arr_quota,
        renewal_quota,
        total_commissionable_arr,
        total_delta_arr,
        total_opp_commissions,
        total_rep_delta_arr,
        total_services_revenue,
        delta_arr as total_opp_delta_arr,
        discover_at_delta_arr as total_opp_discover_at_delta_arr,
        end_arr as total_opp_end_arr,
        expected_arr_delta as total_opp_expected_arr_delta
    from joined_quotas_opps
)

select * from final 
