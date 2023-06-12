with
-- Salesforce Information CTEs

sfdc_accounts as (
  
    select * from {{ ref('stg_salesforce__accounts') }}
    where is_deleted = false

),

sfdc_touchpoints as (
  
    select * from {{ ref('fct_touchpoints') }}

),

sfdc_contacts as (
  
    select * from {{ ref('stg_salesforce__contacts') }}
    where is_deleted = false

),

-- Cloud Account CTEs

cloud_accounts as (
  
    select * from {{ ref('stg_cloud__accounts') }}
    where is_account_deleted = 0

),

invocations as (

    select * from {{ ref('fct_dbt_invocations') }}

),

runs as (

    select * from {{ ref('fct_cloud_run_metrics') }}

),

cloud_account_mappings as (

    select * from {{ ref('cloud_account_mappings') }}

),

user_account_mappings as (

    select * from {{ ref('fct_cloud_user_account_mappings') }}

),

user_activities as (

    select * from {{ ref('fct_cloud_user_account_activities') }}

),

-- Website CTEs

website_sessions as (
  
    select * from {{ ref('fct_web_sessions') }}

),

-- Aggregate CTEs

cloud_accounts_per_sfdc_account as (

    select
        cloud_account_mappings.salesforce_account_id,
        count(distinct cloud_account_mappings.account_id) as count_of_cloud_accounts,
        sum (case
            when datediff(days, cloud_accounts.created_at, current_date()) <=30 then 1
                else 0
        end) as count_of_cloud_accounts_t30d

    from cloud_account_mappings
    left join cloud_accounts on cloud_accounts.account_id = cloud_account_mappings.account_id
    group by 1

),

sessions_per_user as (

    select
    salesforce_contact_id,
    count(distinct session_id) as count_of_web_sessions,
        sum (case
            when datediff(days, session_start, current_date()) <=30 then 1
                else 0
            end
        ) as count_of_session_t30d
    
    from website_sessions
    group by 1
  
),

sessions_per_sfdc_account as (

    select
        sfdc_accounts.account_id as salesforce_account_id,
        sum(count_of_web_sessions) as count_of_web_sessions,
        sum(count_of_session_t30d) as count_of_web_sessions_t30d

    from sessions_per_user
    left join sfdc_contacts
        on sessions_per_user.salesforce_contact_id = sfdc_contacts.contact_id
    left join sfdc_accounts
        on sfdc_accounts.account_id = sfdc_contacts.account_id
    group by 1

),

touchpoints_by_source_per_account as (

{% set touchpoint_sources = {
    'Webinar': 'webinar',
    'Field Marketing': 'field_marketing',
    'Tradeshow': 'tradeshow',
    'Marketing Content Download': 'content_download',
    'Enrolled in dbt Learn': 'dbt_learn',
    'Joined dbt slack': 'joined_slack'
}%}

    select
        account_id,

        sum(
            case
                when datediff(days, opened_at, current_date()) <=30
                    and is_hand_raise_event = true
                    then 1
                else 0
            end
        ) as count_of_hres_t30d,

        {%- for touchpoint_source_name, field_name in touchpoint_sources.items() %}

        sum(
            case
                when datediff(days, opened_at, current_date()) <=30
                    and touchpoint_source = '{{ touchpoint_source_name }}'
                    then 1
                else 0
            end
        ) as count_of_{{ field_name | lower }}_touchpoints_t30d{{ "," if not loop.last }}

        {%- endfor %}

    from sfdc_touchpoints
    group by 1
  
),

models_per_sfdc_account as (

    select
        salesforce_account_id,
        sum(
            case
                when started_at::date between dateadd(day, -60, current_date()) and dateadd(day, -31, current_date())
                    and product = 'scheduler'
                    and command in ('build', 'run')
                    then count_succeed
                else 0
            end
        ) as models_built_prev_t30d,

        sum(
            case when started_at::date between dateadd(day, -31, current_date()) and current_date()
                and product = 'scheduler'
            and command in ('build', 'run')
                then count_succeed
            else 0
        end) as models_built_t30d,
        round(
            (models_built_t30d - models_built_prev_t30d)/nullif(models_built_prev_t30d,0),
            4
        ) as models_built_pct_change

    from invocations
    inner join cloud_account_mappings
        on cloud_account_id = cloud_account_mappings.account_id
    group by 1

),

runs_per_sfdc_account as (

    select 
        salesforce_account_id,
        count(
            case
                when created_at::date between dateadd(day, -60, current_date()) and dateadd(day, -31, current_date())
                    and type = 'cloud_run'
                then unique_id
            end
        ) as job_runs_prev_t30d,
        count(
            case 
                when created_at::date between dateadd(day, -31, current_date()) and current_date()
                    and type = 'cloud_run'
                then unique_id 
            end
        ) as job_runs_t30d,
        round(
            (job_runs_t30d - job_runs_prev_t30d)/nullif(job_runs_prev_t30d,0),
            4
        ) as jobs_run_pct_change

    from runs
    inner join cloud_account_mappings
        on runs.account_id = cloud_account_mappings.account_id
    group by 1

),

active_cloud_users_per_sfdc_account as (

    select
        cloud_account_mappings.salesforce_account_id,
        count(distinct
                case when date_day = dateadd(day, -1, current_date())
                    and t30d_active = 1
                        then email
                end
        ) as cloud_maus,

        count(distinct
                case when date_day = dateadd(day, -31, current_date())
                    and t30d_active = 1
                        then email
                end
        ) as cloud_maus_prev,

        round(
            ((cloud_maus - cloud_maus_prev)/nullif(cloud_maus_prev,0)),
            4
        ) as cloud_maus_pct_change

    from user_activities
    inner join cloud_account_mappings
        on user_activities.account_id = cloud_account_mappings.account_id
    group by 1

),

joined as (

    select
        sfdc_accounts.account_id,
        sfdc_accounts.account_name,
        sfdc_accounts.is_target_account,
        sfdc_accounts.account_region,
        sfdc_accounts.account_status,
        sfdc_accounts.number_of_employees,
        sessions_per_sfdc_account.count_of_web_sessions,
        sessions_per_sfdc_account.count_of_web_sessions_t30d,
        count_of_hres_t30d,
        count_of_webinar_touchpoints_t30d,
        count_of_field_marketing_touchpoints_t30d,
        count_of_tradeshow_touchpoints_t30d,
        count_of_content_download_touchpoints_t30d,
        count_of_dbt_learn_touchpoints_t30d,
        count_of_joined_slack_touchpoints_t30d,
        cloud_accounts_per_sfdc_account.count_of_cloud_accounts_t30d,
        models_per_sfdc_account.models_built_pct_change as models_built_pct_change,
        runs_per_sfdc_account.jobs_run_pct_change as jobs_run_pct_change,
        active_cloud_users_per_sfdc_account.cloud_maus_pct_change as cloud_maus_pct_change

    from sfdc_accounts
    left join sessions_per_sfdc_account
        on sfdc_accounts.account_id = sessions_per_sfdc_account.salesforce_account_id
    left join touchpoints_by_source_per_account
        on sfdc_accounts.account_id = touchpoints_by_source_per_account.account_id
    left join cloud_accounts_per_sfdc_account
        on sfdc_accounts.account_id = cloud_accounts_per_sfdc_account.salesforce_account_id
    left join models_per_sfdc_account
        on sfdc_accounts.account_id = models_per_sfdc_account.salesforce_account_id
    left join runs_per_sfdc_account
        on sfdc_accounts.account_id = runs_per_sfdc_account.salesforce_account_id
    left join active_cloud_users_per_sfdc_account
        on sfdc_accounts.account_id = active_cloud_users_per_sfdc_account.salesforce_account_id
  
),

stages_applied as (

    select
        *,
        case
            when account_status = 'Customer' then 'Purchase'
            when account_status IN ('Prospect - Pipeline', 'Prospect - Pre-Pipeline') then 'Decision'
            when count_of_hres_t30d > 0
                OR count_of_cloud_accounts_t30d > 0
                OR models_built_pct_change > 0.10
                OR jobs_run_pct_change > 0.10
                OR cloud_maus_pct_change > 0.10 
                then 'Consideration'
            when count_of_webinar_touchpoints_t30d > 0
                OR count_of_field_marketing_touchpoints_t30d > 0
                OR count_of_tradeshow_touchpoints_t30d > 0
                OR count_of_content_download_touchpoints_t30d > 0
                OR count_of_dbt_learn_touchpoints_t30d > 0
                OR count_of_joined_slack_touchpoints_t30d > 0
                OR count_of_web_sessions_t30d > 5 then 'Awareness'
                else 'Target' end as abm_stage
    from joined
)

select * from stages_applied
