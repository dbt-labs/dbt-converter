{# each of these metrics uses the same calc to compare the column to assigned dev seats #}
{% set assigned_dev_ratios = {
    'cloud_maus': 't30d_log_ins_to_assigned_dev_seats',
    'ide_users_t30d': 't30d_ide_users_to_assigned_dev_seats',
    'engaged_ide_users_t30d': 't30d_engaged_ide_users_to_assigned_dev_seats',
    'users_w_required_active_days': 't30_daily_logins_to_assigned_dev_seats'
}
%}

{# 
    Date diffs are calculated with the same logic for each of these columns
    The first entry in the list is the default value, the second item is the
    output column name

#}
{% set date_diff_columns = {
    'last_model_changed_at': [9999999999,'days_since_last_model_changed'],
    'last_gong_call': [9999999999, 'days_since_last_gong_call'],
    'last_recv_email': [9999999999, 'days_since_last_recv_email'],
    'last_slack_message_at': [-1, 'days_since_last_slack_message'],
    'champion_left_company_at': [9999999999, 'days_since_champion_left_company'],
    'executive_influencer_left_company_at': [9999999999, 'days_since_executive_influencer_left_company'],
}
%}

with customer_health as (

    select 
        *
    from {{ ref('fct_customer_health') }}
    --for now we will only score enterprise and team plan customers
    where plan ilike any ('enterprise%','team%')

),

user_activity as (

    select * from {{ ref('int__customer_account_user_activity') }}
),

metric_calculations as (

    select
        customer_health.customer_id,
        customer_health.ref_salesforce_account_id,
        customer_health.customer_name,
        customer_tenure_in_days,
        sales_motion,
        coalesce(market_segment, 'Commercial') as score_market_segment,
        coalesce(days_to_renewal, -1) as days_to_renewal,
        coalesce(is_churned_customer, 'FALSE') as is_churned,
        
    --manual feeling score, converted to numeric to match buckets
        account_health,
        case
            when account_health = 'Green' then 1
            when account_health = 'Yellow' then 2
            when account_health = 'Red' then 3
            else 9999999999
        end as account_health_numeric,
        
    --Feature Usage
        coalesce(cloud_maus,0) as cloud_maus,
        coalesce(ide_users_t30d,0) as ide_users_t30d,
        --login metric uses different columns depending on the customer type
        case
            when sales_motion = 'Managed' and score_market_segment = 'Enterprise' then user_activity.active_6_plus_days
            when sales_motion = 'Managed' and score_market_segment = 'Commercial' then user_activity.active_4_plus_days
            when sales_motion = 'Self-Service' and score_market_segment = 'Enterprise' then user_activity.active_4_plus_days
            when sales_motion = 'Self-Service' and score_market_segment = 'Commercial' then user_activity.active_2_plus_days
            else null
        end as users_w_required_active_days,
        coalesce(t30d_job_runs,0) as t30d_job_runs,
        coalesce(t30d_job_runs_successful,0) as t30d_job_runs_successful,

        {% for comparison_column, ouput_column_name in assigned_dev_ratios.items() %}

            round(
            coalesce(
                {{ comparison_column }}/nullif(total_assigned_developers, 0)
                ,0
            ),
            2
        ) as {{ ouput_column_name }},

        {% endfor %}

    -- "days since" calculations
        {% for input_column, output_info in date_diff_columns.items() %}
            coalesce(
                datediff(
                    'day',
                    {{ input_column}}, 
                    current_date
                ),
                {{ output_info[0] }}
            ) as {{ output_info[1] }},
        {% endfor %}

    --dbt Value Score
        coalesce(models_built_pct_change,0) as models_built_pct_change,
        
    --Engagement Score
        coalesce(slack_user_count,0) as slack_user_count,
        coalesce(slack_user_active_past_quarter_count,0) as slack_user_active_past_quarter_count,
        coalesce(has_champion_left,0) as has_champion_left,
        coalesce(has_executive_influencer_left,0) as has_executive_influencer_left,
        coalesce(round(hubspot_open_rate,2), 0) as hubspot_open_rate

    from customer_health
    left join user_activity using (customer_id)

)

select * from metric_calculations