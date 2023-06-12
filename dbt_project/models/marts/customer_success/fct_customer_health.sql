with customers as (

    select * from {{ ref('dim_customers') }}

),

salesforce_accounts as (

    select * from {{ ref('dim_salesforce_accounts') }} 

),

salesforce_contacts as (

    select 
        account_id,
        contact_id,
        persona,
        --take least of when event occured since job_started_at isn't populated as frequently
        least(
            coalesce(champify__job_started_at,'2999-01-01'::date),
            coalesce(champify__job_change_detected_at,'2999-01-01'::date)
        ) as left_company_at

    from {{ ref('dim_salesforce_contacts') }} 
    where
        persona in ('The Champion', 'The Executive Influencer')
        and is_no_longer_at_company
        --only score them if we know when they left
        and coalesce(champify__job_started_at,champify__job_change_detected_at) is not null
),

feature_usage_events as (

    select * from {{ ref('fct_cloud_accounts_feature_usage') }} 
    where is_current_paying_account

),

customer_acct_utilization as (

    select * from {{ ref('int__customer_account_utilization') }}

),

customer_acct_project as (

    select * from {{ ref('int__customer_account_project') }}

),

customer_acct_usage as (

    select * from {{ ref('int__customer_account_usage_activity') }}

),

customer_usage_runs as (

    select * from {{ ref('int__customer_account_usage_cloud_runs') }}

),

customer_core_usage_runs as (

    select * from {{ ref('int__customer_account_usage_core_runs') }}

),

customer_acct_feedback as (

    select * from {{ ref('int__customer_account_feedback') }}

),

customer_slack_activity as (

    select * from {{ ref('int__customer_slack_activity') }}

),

customer_hubspot_activity as (

    select * from {{ ref('int__customer_account_hubspot_activity') }}

),

contact_activity as (

    select 
        account_id,
        count(contact_id) as contact_left_count,

        max(
            case when persona = 'The Champion' then 1
            else 0
            end) as has_champion_left,
        max(
            case when persona = 'The Champion' then left_company_at
            else null
            end) as champion_left_company_at,

        max(
            case when persona = 'The Executive Influencer' then 1
            else 0
            end) as has_executive_influencer_left,
        max(
            case when persona = 'The Executive Influencer' then left_company_at
            else null
            end) as executive_influencer_left_company_at

    from salesforce_contacts
    group by 1

),

------------------------- ACCOUNT FEATURE USAGE
cloud_accounts_pivoted as (

    {%-
        set feature_names = dbt_utils.get_column_values(
        table=ref('fct_cloud_accounts_feature_usage'),
        column='feature_name')
        
    -%}

   select
        customer_id

        {% for feature_name in feature_names %}

        ,min(case when feature_name = '{{feature_name}}' then in_use end) as has_{{feature_name}}

        ,min(case when feature_name = '{{feature_name}}' then first_used_timestamp end) as {{feature_name}}_first_used_timestamp

        ,min(case when feature_name = '{{feature_name}}' then last_used_timestamp end) as {{feature_name}}_last_used_timestamp


    {% endfor %}

    from feature_usage_events

    group by 1

),

joined as (

    select
        customers.customer_id,
        customers.customer_id_type,
        customers.ref_salesforce_account_id,
        customers.customer_name,
        customers.sales_motion,
        customers.cloud_account_id,

        coalesce(
            customers.is_current,
            false
        ) as is_current_customer,

        case
            when not customers.is_current
                then true
        end as is_churned_customer,
        datediff(
            days,
            customers.customer_start,
            current_date
        ) as customer_tenure_in_days,

        salesforce_accounts.account_health,
        salesforce_accounts.account_name as sfdc_account_name,
        salesforce_accounts.owner_name,
        salesforce_accounts.technical_lead,
        salesforce_accounts.account_region,
        salesforce_accounts.account_subregion,
        salesforce_accounts.market_segment,
        customer_acct_utilization.plan,
        customer_acct_utilization.plan_tier,
        salesforce_accounts.deployment_type,
        salesforce_accounts.days_to_renewal,
        salesforce_accounts.customer_life_cycle_phase,
        salesforce_accounts.current_arr,
        salesforce_accounts.last_gong_call,
        salesforce_accounts.last_activity_1_way,
        salesforce_accounts.last_contact_two_way,
        salesforce_accounts.last_recv_email,
        customer_acct_utilization.run_slots,
        salesforce_accounts.is_p1_team_migration_account,

----- SEAT UTILIZATION
        customer_acct_utilization.total_purchased_seats,
        customer_acct_utilization.total_purchased_seats_developer,
        customer_acct_utilization.total_purchased_seats_read_only,

        customer_acct_utilization.total_assigned_seats,
        customer_acct_utilization.total_assigned_developers,
        customer_acct_utilization.total_assigned_read_only,

        customer_acct_utilization.seat_utilization_pct,
        customer_acct_utilization.seat_utilization_pct_developer,
        customer_acct_utilization.seat_utilization_pct_read_only,

---------ACCOUNT HEALTH METRICS
        customer_acct_usage.cloud_maus,
        customer_acct_usage.cloud_maus_prev,
        customer_acct_usage.cloud_maus_pct_change,

        customer_acct_project.models_built_t30d,
        customer_acct_project.models_built_t60d,
        customer_acct_project.models_built_t90d,
        customer_acct_project.models_built_prev_t30d,
        customer_acct_project.models_built_pct_change,

        customer_acct_project.last_project_growth_at,
        customer_acct_project.last_model_changed_at,

        customer_acct_usage.ide_users_t30d,
        customer_acct_usage.ide_users_prev,
        customer_acct_usage.ide_users_pct_change,

        customer_acct_usage.engaged_ide_users_t30d,
        customer_acct_usage.engaged_ide_users_prev,
        customer_acct_usage.engaged_ide_users_pct_change,
        customer_acct_usage.t30d_ide_time_engaged_in_s,
        customer_acct_usage.prev_t30d_ide_time_engaged_in_s,

        customer_usage_runs.t7d_ide_sessions_failed,
        customer_usage_runs.t7d_ide_sessions_successful,
        customer_usage_runs.prev_t7d_ide_sessions_successful,
        customer_usage_runs.t30d_ide_sessions_successful,
        customer_usage_runs.t90d_ide_sessions_successful,
        customer_usage_runs.prev_t30d_ide_sessions_successful,
        customer_usage_runs.t7d_ide_sessions,
        customer_usage_runs.prev_t7d_ide_sessions,
        customer_usage_runs.t30d_ide_sessions,
        customer_usage_runs.prev_t30d_ide_sessions,
        customer_usage_runs.t90d_ide_sessions,
        customer_usage_runs.t7d_ide_sessions_pct_change,
        customer_usage_runs.t7d_ide_sessions_successful_pct_change,
        customer_usage_runs.t30d_ide_sessions_pct_change,
        customer_usage_runs.t30d_ide_sessions_successful_pct_change,

        customer_usage_runs.t7d_job_runs_failed,
        customer_usage_runs.t7d_job_runs_successful,
        customer_usage_runs.prev_t7d_job_runs_successful,
        customer_usage_runs.t30d_job_runs_successful,
        customer_usage_runs.prev_t30d_job_runs_successful,
        customer_usage_runs.t90d_job_runs_successful,
        customer_usage_runs.t7d_job_runs,
        customer_usage_runs.prev_t7d_job_runs,
        customer_usage_runs.t30d_job_runs,
        customer_usage_runs.prev_t30d_job_runs,
        customer_usage_runs.t90d_job_runs,
        customer_usage_runs.t7d_job_runs_pct_change,
        customer_usage_runs.t7d_job_runs_successful_pct_change,
        customer_usage_runs.t30d_job_runs_pct_change,
        customer_usage_runs.t30d_job_runs_successful_pct_change,

---------CORE RUNS
        customer_core_usage_runs.t7d_core_runs,
        customer_core_usage_runs.prev_t7d_core_runs,
        customer_core_usage_runs.t30d_core_runs,
        customer_core_usage_runs.prev_t30d_core_runs,
        customer_core_usage_runs.t90d_core_runs,
        customer_core_usage_runs.t7d_core_runs_successful,
        customer_core_usage_runs.prev_t7d_core_runs_successful,
        customer_core_usage_runs.t30d_core_runs_successful,
        customer_core_usage_runs.prev_t30d_core_runs_successful,
        customer_core_usage_runs.t90d_core_runs_successful,
        customer_core_usage_runs.t7d_core_runs_failed,
        customer_core_usage_runs.prev_t7d_core_runs_failed,
        customer_core_usage_runs.t30d_core_runs_failed,
        customer_core_usage_runs.prev_t30d_core_runs_failed,
        customer_core_usage_runs.t90d_core_runs_failed,
        customer_core_usage_runs.t7d_core_models_built,
        customer_core_usage_runs.prev_t7d_core_models_built,
        customer_core_usage_runs.t30d_core_models_built,
        customer_core_usage_runs.prev_t30d_core_models_built,
        customer_core_usage_runs.t90d_core_models_built,
        customer_core_usage_runs.t7d_core_runs_pct_change,
        customer_core_usage_runs.t30d_core_runs_pct_change,
        customer_core_usage_runs.t7d_core_runs_successful_pct_change,
        customer_core_usage_runs.t30d_core_runs_successful_pct_change,
        customer_core_usage_runs.t7d_core_runs_failed_pct_change,
        customer_core_usage_runs.t30d_core_runs_failed_pct_change,
        customer_core_usage_runs.t7d_core_models_built_pct_change,
        customer_core_usage_runs.t30d_core_models_built_pct_change,

---------CUSTOMER FEEDBACK
        customer_acct_feedback.avg_csat,
        customer_acct_feedback.nps_score,
        customer_acct_feedback.total_support_tickets,
        customer_acct_feedback.open_support_tickets,

---------SLACK ACTIVITY
        customer_slack_activity.slack_user_count,
        customer_slack_activity.slack_user_active_past_quarter_count,
        customer_slack_activity.last_slack_message_at,

---------CONTACT ACTIVITY
        contact_activity.contact_left_count,
        contact_activity.has_champion_left,
        contact_activity.champion_left_company_at,
        contact_activity.has_executive_influencer_left,
        contact_activity.executive_influencer_left_company_at,

---------HUBSPOT ACTIVITY
        customer_hubspot_activity.hubspot_open_rate

    from customers
    left join salesforce_accounts
        on customers.ref_salesforce_account_id = salesforce_accounts.account_id
    left join customer_acct_project
        on customers.customer_id = customer_acct_project.customer_id
    left join customer_acct_usage
        on customers.customer_id = customer_acct_usage.customer_id
    left join customer_usage_runs
        on customers.customer_id = customer_usage_runs.customer_id
    left join customer_core_usage_runs
        on customers.customer_id = customer_core_usage_runs.customer_id
    left join customer_acct_feedback
        on customers.customer_id = customer_acct_feedback.customer_id
    left join customer_acct_utilization
        on customers.customer_id = customer_acct_utilization.customer_id
    left join customer_slack_activity
        on customers.customer_id = customer_slack_activity.customer_id
    left join contact_activity
        on customers.ref_salesforce_account_id = contact_activity.account_id
    left join customer_hubspot_activity
        on customers.ref_salesforce_account_id = customer_hubspot_activity.salesforce_account_id

),

with_features as (

    select
        *
    from joined
    left join cloud_accounts_pivoted using (customer_id)

)

select * from with_features 