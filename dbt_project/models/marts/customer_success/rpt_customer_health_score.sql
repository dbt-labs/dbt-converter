{# Assign join columns and info for feeding to macro to create joins #}
{% set score_metrics = {
    'any_log_ins': {
        'join_column': 'cloud_maus'
    },
    'login_to_assigned_dev_seat': {
        'join_column': 't30_daily_logins_to_assigned_dev_seats'
    },
    'running_jobs': {
        'join_column': 't30d_job_runs'
    },
    'assigned_devs_engaged_w_ide': {
        'join_column': 't30d_engaged_ide_users_to_assigned_dev_seats'
    },
    'days_since_last_model_changed': {
        'join_column': 'days_since_last_model_changed'
    },
    'project_size_change': {
        'join_column': {
            'bucket': 'models_built_pct_change',
            'customer_tenure': 'customer_tenure_in_days'
        }
    },
    'days_since_last_gong_call': {
        'join_column': 'days_since_last_gong_call'
    },
    'days_since_last_email_received': {
        'join_column': 'days_since_last_recv_email'
    },
    'hubspot_open_rate': {
        'join_column': 'hubspot_open_rate'
    },
    'active_in_slack': {
        'join_column': 'days_since_last_slack_message'
    },
    'days_since_champion_left_company': {
        'join_column': 'days_since_champion_left_company'
    },
    'days_since_executive_influencer_left_company': {
        'join_column': 'days_since_executive_influencer_left_company'
    },
    'manual_score': {
        'join_column': 'account_health_numeric'
    }
}
%}


with customer_health_calcs as (
    
    select * from {{ ref('int__customer_health_calculations') }}
    
),

score_buckets as (

    select *
    from {{ ref('stg_googlesheets__customer_health_score_buckets') }}
),

category_weights as (

    select *
    from {{ ref('stg_googlesheets__customer_health_score_category_weights') }}
),

overall_weights as (

    select *
    from {{ ref('stg_googlesheets__customer_health_score_overall_weights') }}
),
--This cte explodes out the 3 scoring tables to the possible combinations
scoring_combined as (

    select 
        score_buckets.*,
        category_weights.sales_motion as category_sales_motion,
        category_weights.category_weight,
        overall_weights.sales_motion as overall_sales_motion,
        overall_weights.overall_weight
    from score_buckets
        left join category_weights on
            score_buckets.metric_category = category_weights.metric_category
            and score_buckets.general_metric = category_weights.general_metric
            and score_buckets.sales_motion = category_weights.sales_motion
        left join overall_weights on
            score_buckets.metric_category = overall_weights.metric_category
            and score_buckets.sales_motion = overall_weights.sales_motion

),

--This cte joins customer health to the buckets and weights
--Every score is a join to allow for custom logic on matching to the buckets and weights
customer_health_scored as (

    select
        customer_health_calcs.*,
        
        {% for metric in score_metrics.keys() -%}
            coalesce({{ metric }}.bucket_score, 0) as {{ metric }}_raw_score,

            coalesce(
                    {{ metric }}.bucket_score * {{ metric }}.category_weight * {{ metric }}.overall_weight,
                0) as {{ metric }}_weighted_score,

            {# Looker needs to know the max score to show where a customer is missing points #}
            coalesce( 100 * {{ metric }}.category_weight * {{ metric }}.overall_weight, 0) as {{ metric }}_max_available_score,

        {% endfor -%}
        --final weighted score is a sum of all the weighted scores from above
        coalesce(
            {% for metric in score_metrics -%}
                {{ metric }}_weighted_score
                {% if not loop.last %}
                    +
                {% endif %}
            {% endfor%}
            , 0
        ) as customer_health_score,

        --this is put back into Salesforce as a green/yellow/red value
        case
            when customer_health_score > 66.6667 then 'Green'
            when customer_health_score between 33.334 and 66.6667 then 'Yellow'
            when customer_health_score < 33.334 then 'Red'
            else '0'
        end as customer_health_score_color,
        
        current_timestamp() as scored_at
        
    from customer_health_calcs
       {{ customer_health_join(score_metrics) }}
)

select * from customer_health_scored