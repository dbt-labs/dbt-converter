with

account_events as (

    select * from {{ ref('stg_cloud__accounts_snapshot_daily') }}

),

account_details as (

    select * from {{ ref('fct_cloud_accounts') }}

),

---to remove unverified accounts
user_accounts as (

    select * from {{ ref('fct_cloud_user_account_mappings') }}

),

---set-up events section
user_permissions as (

    select * from {{ ref('stg_cloud__user_licenses_snapshot_daily') }}

),

environments as (

    select * from {{ ref('dim_cloud_environments') }}

),

repos as (

    select * from {{ ref('stg_cloud__repos') }}

),

jobs as (

    select * from {{ ref('dim_cloud_jobs') }}

),

connections as (

    select * from {{ ref('stg_cloud__connections') }}

),

invocations as (

    select * from {{ ref('fct_dbt_invocations') }}

),

---activity events section
runs as (

    select * from {{ ref('fct_cloud_run_metrics') }}

),

ide_events as (

    select * from {{ ref('fct_cloud_ide_sessions') }} 

),

pageviews as (

    select * from {{ ref('fct_web_pageviews') }}

),

docs as (

    select * from {{ ref('dbt_docs_sessions') }}

),

semantic_layer_environments as (

    select * from {{ ref('dim_cloud_semantic_layers') }}

),

semantic_layer_queries as (

    select * from {{ ref('fct_semantic_layer_queries') }}

),

-------------------------------- UTILS

verified_accounts as (

    select
        account_id,
        salesforce_account_id,
        sfdc_parent_account_id,
        is_primary_cloud_account,
        sum(is_verified) as total_verified_users

    from user_accounts
    group by 1,2,3,4

),

-------------------------------- SET-UP EVENTS

users_agg as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'date_day',
            'account_id'])
        }} as id,

        account_id,
        date_day,
        count(case when license_type = 'developer' and is_user_license_deleted = 0 then user_license_id end) as added_developer_seats,
        count(case when license_type = 'read_only' and is_user_license_deleted = 0 then user_license_id end) as added_read_only_seats,
        sum(case when license_type = 'developer' then is_user_license_deleted end) as deleted_developer_seats,
        sum(case when license_type = 'read_only' then is_user_license_deleted end) as deleted_read_only_seats

    from user_permissions
    group by 1,2,3

),

connections_agg as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'created_at::date',
            'account_id'])
        }} as id,

        account_id,
        created_at::date as date_day,
        count(*) as added_connections

    from connections
    group by 1,2,3

),

environments_agg as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'created_at::date',
            'account_id'])
        }} as id,

        account_id,
        created_at::date as date_day,
        count(*) as added_environments

    from environments
    group by 1,2,3

),

repos_agg as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'created_at::date',
            'account_id'])
        }} as id,

        account_id,
        created_at::date as date_day,
        count(*) as added_repos

    from repos
    group by 1,2,3

),

jobs_agg as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'created_at::date',
            'account_id'])
        }} as id,

        account_id,
        created_at::date as date_day,
        count(*) as added_jobs

    from jobs
    group by 1,2,3

),

---------------------- ACTIVITY METRICS
runs_agg as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'created_at::date',
            'account_id'])
        }} as id,

        account_id,
        created_at::date as date_day,
        count(case when type = 'cloud_run' then unique_id end) as total_job_runs,
        count(case when status_name = 'complete' and type = 'cloud_run' then unique_id end) as successful_job_runs,
        count(case when status_name = 'error' and type = 'cloud_run' then unique_id end) as failed_job_runs,
        sum(case when status_name = 'complete' and type = 'cloud_run' then duration_in_sec end) as job_run_duration_in_s,
        sum(case when status_name = 'complete' and type = 'develop_request' then duration_in_sec end) as ide_usage_duration_in_s

    from runs
    group by 1,2,3

),

--This CTE measures whether an account is active
engagement_agg as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'page_view_start::date',
            'cloud_account_id'])
        }} as id,

        cloud_account_id as account_id,
        page_view_start::date as date_day,

        count(*) as total_count_pageviews, 
        count(distinct inferred_user_id) as total_users,
        sum(time_engaged_in_s) as total_time_engaged_in_s

    from pageviews
    group by 1,2,3

),

deployment_events_agg as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'page_view_start::date',
            'cloud_account_id'])
        }} as id,

        cloud_account_id as account_id,
        page_view_start::date as date_day,

        count(*) as deployment_count_pageviews,
        sum(time_engaged_in_s) as deployment_time_engaged_in_s,
        sum(case when page_url_fragment like '%/runs/%' then 1 else 0 end) as deployment_count_run_history_pageviews,
        sum(case when page_url_fragment like '%/sources/%' then 1 else 0 end) as deployment_count_snapshot_freshness_pageviews,
        sum(case 
                when page_url_fragment not like '%/runs/%' 
                and page_url_fragment not like '%/sources/%' 
            then 1 else 0 end
        ) as deployment_count_administrative_pageviews,
        sum(case when page_url_fragment like '%/runs/%' then time_engaged_in_s else 0 end) as deployment_run_history_time_engaged_in_s,
        sum(case when page_url_fragment like '%/sources/%' then time_engaged_in_s else 0 end) as deployment_snapshot_freshness_time_engaged_in_s,
        sum(case 
                when page_url_fragment not like '%/runs/%' 
                and page_url_fragment not like '%/sources/%' 
            then time_engaged_in_s else 0 end
        ) as deployment_administrative_time_engaged_in_s

    from pageviews
    where user_custom_id is not null
      and cloud_account_id is not null
      and cloud_page_type = 'scheduled run'
    group by 1,2,3

),

setup_events_agg as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'page_view_start::date',
            'cloud_account_id'])
        }} as id,

        cloud_account_id as account_id,
        page_view_start::date as date_day,

        sum(case when page_url_fragment like any ('%/create/%','%/setup/%','%/new/%','%/invite%') then 1 else 0 end) as setup_count_pageviews,
        sum(case when page_url_fragment like '%/invite%' then 1 else 0 end) as setup_count_invite_pageviews,
        sum(case when page_url_fragment like any ('%/projects/setup/create/%', '%/projects/setup/%') then 1 else 0 end) as setup_count_project_pageviews,
        sum(case when page_url_fragment like any ('%/setup/connection/%', '%/connections/new/%') then 1 else 0 end) as setup_count_connection_pageviews,
        sum(case when page_url_fragment like '%/environments/create/%' then 1 else 0 end) as setup_count_environment_pageviews,
        sum(case when page_url_fragment like '%/repositories/create/%' then 1 else 0 end) as setup_count_repo_pageviews

    from pageviews
    where user_custom_id is not null
      and cloud_account_id is not null
      and cloud_page_type in ('account settings','onboarding')
    group by 1,2,3

),

docs_sessions_agg as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'session_start::date',
            'cloud_account_id'])
        }} as id,

        cloud_account_id as account_id,
        session_start::date as date_day,

        count(*) as docs_count_sessions,
        sum(time_engaged_in_s) as docs_time_engaged_in_s

    from docs
    where cloud_account_id is not null
    and session_start is not null
    group by 1,2,3

),

ide_events_agg as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'created_at::date',
            'account_id'])
        }} as id,

        account_id,
        created_at::date as date_day,

        count(distinct user_id) as ide_count_active_users,
        sum(is_successful_session) as ide_count_develop_sessions,
        sum(is_failed_session) as ide_count_failed_develop_sessions,
        count(develop_request_id) as ide_count_total_sessions,
        sum(count_tab_views) as ide_count_tab_views,
        sum(count_invocations) as ide_count_dbt_invocations,
        sum(count_successful_invocations) as ide_successful_invocations,
        sum(count_compile_sql_operations) as ide_compiled_sql_events,
        sum(count_run_sql_operations) as ide_run_sql_events,
        sum(count_operations) as ide_count_dbt_queries_run,
        sum(count_page_refreshes) as ide_count_page_refreshes,
        sum(time_engaged_in_s) as ide_time_engaged_in_s

    from ide_events
    group by 1,2,3

),

invocations_agg as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'started_at::date',
            'cloud_account_id'])
        }} as id,
        cloud_account_id as account_id,
        started_at::date as date_day,
        count(
              case
                  when project_count_metrics > 0 
                      then 1
                  else 0
        end) as count_of_invocations_with_metrics
    from invocations
    where distribution = 'cloud'
    group by 1,2,3

),

semantic_layer_env_creation as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'created_at::date',
            'account_id'])
        }} as id,

        account_id,
        created_at::date as date_day,
        count(semantic_layer_id) as count_semantic_layer_environments_created

    from semantic_layer_environments
    {{ dbt_utils.group_by(3) }}

),

semantic_layer_query_agg as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'compile_start::date',
            'account_id'])
        }} as id,

        account_id,
        compile_start::date as date_day,
        count(
            case
                when is_active_semantic_layer_usage
                then 1
            end) as count_semantic_layer_queries

    from semantic_layer_queries
    {{ dbt_utils.group_by(3) }}

),

joined as (

    select
        account_events.*,
        account_details.salesforce_account_id,
        account_details.sfdc_parent_account_id,
        account_details.customer_id,
        account_details.is_paying_account,
        account_details.is_current_paying_account,
        account_details.is_primary_cloud_account,
        account_details.is_semantic_layer_eligible,

        coalesce(added_developer_seats,0) as added_developer_seats,
        coalesce(added_read_only_seats,0) as added_read_only_seats,
        coalesce(deleted_developer_seats,0) as deleted_developer_seats,
        coalesce(deleted_read_only_seats,0) as deleted_read_only_seats,

        coalesce(added_environments,0) as added_environments,
        coalesce(added_repos,0) as added_repos,
        coalesce(added_jobs,0) as added_jobs,

        coalesce(total_job_runs,0) as total_job_runs,
        coalesce(successful_job_runs,0) as successful_job_runs,
        coalesce(failed_job_runs,0) as failed_job_runs,
        coalesce(job_run_duration_in_s,0) as job_run_duration_in_s,

        coalesce(total_count_pageviews,0) as total_count_pageviews,
        coalesce(total_time_engaged_in_s,0) as total_time_engaged_in_s,
        coalesce(engagement_agg.total_users,0) as total_users,

        coalesce(deployment_count_pageviews,0) as deployment_count_pageviews,
        coalesce(deployment_time_engaged_in_s,0) as deployment_time_engaged_in_s,
        coalesce(deployment_count_run_history_pageviews,0) as deployment_count_run_history_pageviews,
        coalesce(deployment_count_snapshot_freshness_pageviews,0) as deployment_count_snapshot_freshness_pageviews,
        coalesce(deployment_count_administrative_pageviews,0) as deployment_count_administrative_pageviews,
        coalesce(deployment_run_history_time_engaged_in_s,0) as deployment_run_history_time_engaged_in_s,
        coalesce(deployment_snapshot_freshness_time_engaged_in_s,0) as deployment_snapshot_freshness_time_engaged_in_s,
        coalesce(deployment_administrative_time_engaged_in_s,0) as deployment_administrative_time_engaged_in_s,

        coalesce(setup_count_pageviews, 0) as setup_count_pageviews,
        coalesce(setup_count_invite_pageviews, 0) as setup_count_invite_pageviews,
        coalesce(setup_count_project_pageviews, 0) as setup_count_project_pageviews,
        coalesce(setup_count_connection_pageviews, 0) as setup_count_connection_pageviews,
        coalesce(setup_count_environment_pageviews, 0) as setup_count_environment_pageviews,
        coalesce(setup_count_repo_pageviews, 0) as setup_count_repo_pageviews,

        coalesce(docs_count_sessions,0) as docs_count_sessions,
        coalesce(docs_time_engaged_in_s,0) as docs_time_engaged_in_s,

        coalesce(ide_count_active_users,0) as ide_count_active_users,
        coalesce(ide_count_develop_sessions,0) as ide_count_develop_sessions,
        coalesce(ide_count_failed_develop_sessions,0) as ide_count_failed_develop_sessions,
        coalesce(ide_count_total_sessions, 0) as ide_count_total_sessions,
        coalesce(ide_count_tab_views,0) as ide_count_tab_views,
        coalesce(ide_count_dbt_invocations,0) as ide_count_dbt_invocations,
        coalesce(ide_successful_invocations,0) as ide_successful_invocations,
        coalesce(ide_compiled_sql_events,0) as ide_compiled_sql_events,
        coalesce(ide_run_sql_events,0) as ide_run_sql_events,
        coalesce(ide_count_dbt_queries_run,0) as ide_count_dbt_queries_run,
        coalesce(ide_count_page_refreshes,0) as ide_count_page_refreshes,
        coalesce(ide_time_engaged_in_s,0) as ide_time_engaged_in_s,
        coalesce(ide_usage_duration_in_s,0) as ide_usage_duration_in_s,

        case when date_day = first_paid_at::date then 1 else 0 end as first_paid_self_service,
        case when date_day = first_paid_managed_at::date then 1 else 0 end as first_paid_enterprise,
        coalesce(count_semantic_layer_environments_created,0) as count_semantic_layer_environments_created,
        coalesce(count_semantic_layer_queries,0) as count_semantic_layer_queries,
        coalesce(count_of_invocations_with_metrics,0) as count_of_invocations_with_metrics,

    --these look at activity via usage
        case when total_job_runs > 0 then 1 else 0 end as is_active_job_runs,
        case when successful_job_runs > 0 then 1 else 0 end as is_active_successful_job_runs,
        case when failed_job_runs > 0 then 1 else 0 end as is_active_failed_job_runs,
        case when ide_count_develop_sessions > 0 then 1 else 0 end as is_active_ide,

    --these look at activity via pageviews
        case when total_count_pageviews > 0 then 1 else 0 end as is_active_login,
        case when deployment_count_pageviews > 0 then 1 else 0 end as is_active_scheduled_runs,
        case when deployment_count_snapshot_freshness_pageviews > 0 then 1 else 0 end as is_active_snapshot_freshness,
        case when docs_count_sessions > 0 then 1 else 0 end as is_active_docs,
        case when setup_count_invite_pageviews > 0 then 1 else 0 end as is_active_setup_invite,
        case when setup_count_project_pageviews > 0 then 1 else 0 end as is_active_setup_project,
        case when setup_count_connection_pageviews > 0 then 1 else 0 end as is_active_setup_connection,
        case when setup_count_environment_pageviews > 0 then 1 else 0 end as is_active_setup_environment,
        case when setup_count_repo_pageviews > 0 then 1 else 0 end as is_active_setup_repo,

    --these look at semantic layer usage
        case when count_semantic_layer_queries > 0 then 1 else 0 end as is_semantic_layer_active,
        case when count_of_invocations_with_metrics > 0 then 1 else 0 end as is_active_metrics,

    --this synthesizes key activity types into a holistic concept of "active"
        case 
            when is_active_successful_job_runs = 1
                then 1
    --the following criteria are being actively considered by the growth and data teams
    --but any changes to the company definition of an active account is surfaced to the 
    --board of directors. 
            -- when is_active_ide = 1
            --     then 1
            -- when is_active_login = 1
            --     then 1
        end as is_active, 

    -- ide session averages 
        ide_time_engaged_in_s/nullif(engagement_agg.total_users,0) as ide_avg_session_time_per_user,
        ide_time_engaged_in_s/nullif(ide_count_active_users,0) as ide_avg_session_time_per_active_user


    from account_events
    left join users_agg using (id)
    left join environments_agg using (id)
    left join connections_agg using (id)
    left join repos_agg using (id)
    left join jobs_agg using (id)
    left join runs_agg using (id)

    left join engagement_agg using (id)
    left join deployment_events_agg using (id)
    left join docs_sessions_agg using (id)
    left join setup_events_agg using (id)
    left join ide_events_agg using (id)
    left join invocations_agg using (id)
    left join semantic_layer_env_creation using (id)
    left join semantic_layer_query_agg using (id)

    inner join account_details
        on account_events.account_id = account_details.account_id

),

activities as (

    select
        *,
        max(case when is_active = 1 then date_day end)
            over (
            partition by account_id
        ) as last_active_date,

        date_day = last_active_date::date as is_user_last_login,

        max(is_active) over (
            partition by account_id
            order by date_day
            rows between 6 preceding and current row
        ) as t7d_active,

        max(is_active_job_runs) over (
            partition by account_id
            order by date_day
            rows between 6 preceding and current row
        ) as t7d_job_active,

        max(is_active_successful_job_runs) over (
            partition by account_id
            order by date_day
            rows between 6 preceding and current row
        ) as t7d_successful_job_active,

        max(is_active_ide) over (
            partition by account_id
            order by date_day
            rows between 6 preceding and current row
        ) as t7d_ide_active,

        max(is_semantic_layer_active) over (
            partition by account_id
            order by date_day
            rows between 6 preceding and current row
        ) as t7d_semantic_layer_active,

        sum(total_job_runs) over (
            partition by account_id
            order by date_day
            rows between 6 preceding and current row
        ) as t7d_job_runs,

        sum(successful_job_runs) over (
            partition by account_id
            order by date_day
            rows between 6 preceding and current row
        ) as t7d_job_runs_successful,

        sum(failed_job_runs) over (
            partition by account_id
            order by date_day
            rows between 6 preceding and current row
        ) as t7d_job_runs_failed,

        sum(ide_count_develop_sessions) over (
            partition by account_id
            order by date_day
            rows between 6 preceding and current row
        ) as t7d_ide_sessions_successful,

        sum(ide_count_failed_develop_sessions) over (
            partition by account_id
            order by date_day
            rows between 6 preceding and current row
        ) as t7d_ide_sessions_failed,

        sum(ide_count_total_sessions) over (
            partition by account_id
            order by date_day
            rows between 6 preceding and current row
        ) as t7d_ide_sessions,

        sum(ide_time_engaged_in_s) over (
            partition by account_id
            order by date_day
            rows between 6 preceding and current row
        ) as t7d_ide_time_engaged_in_s,

        max(is_active_login) over (
            partition by account_id
            order by date_day
            rows between 6 preceding and current row
        ) as t7d_login_active,

        max(is_active_docs) over (
            partition by account_id
            order by date_day
            rows between 6 preceding and current row
        ) as t7d_docs_active,

        sum(docs_count_sessions) over (
            partition by account_id
            order by date_day
            rows between 6 preceding and current row
        ) as t7d_docs_sessions,

        sum(docs_time_engaged_in_s) over (
            partition by account_id
            order by date_day
            rows between 6 preceding and current row
        ) as t7d_docs_time_engaged_in_s,

        sum(count_semantic_layer_queries) over (
            partition by account_id
            order by date_day
            rows between 6 preceding and current row
        ) as t7d_semantic_layer_queries,

        max(is_active) over (
            partition by account_id
            order by date_day
            rows between 29 preceding and current row
        ) as t30d_active,

        max(is_active_job_runs) over (
            partition by account_id
            order by date_day
            rows between 29 preceding and current row
        ) as t30d_job_active,

        max(is_active_successful_job_runs) over (
            partition by account_id
            order by date_day
            rows between 29 preceding and current row
        ) as t30d_successful_job_active,

        max(is_active_ide) over (
            partition by account_id
            order by date_day
            rows between 29 preceding and current row
        ) as t30d_ide_active,

        max(is_semantic_layer_active) over (
            partition by account_id
            order by date_day
            rows between 29 preceding and current row
        ) as t30d_semantic_layer_active,

        sum(ide_count_total_sessions) over (
            partition by account_id
            order by date_day
            rows between 29 preceding and current row
        ) as t30d_ide_sessions,

        sum(ide_count_develop_sessions) over (
            partition by account_id
            order by date_day
            rows between 29 preceding and current row
        ) as t30d_ide_sessions_successful,

        sum(ide_count_failed_develop_sessions) over (
            partition by account_id
            order by date_day
            rows between 29 preceding and current row
        ) as t30d_ide_sessions_failed,

        sum(ide_time_engaged_in_s) over (
            partition by account_id
            order by date_day
            rows between 29 preceding and current row
        ) as t30d_ide_time_engaged_in_s,

        max(is_active_login) over (
            partition by account_id
            order by date_day
            rows between 29 preceding and current row
        ) as t30d_login_active,

        max(is_active_docs) over (
            partition by account_id
            order by date_day
            rows between 29 preceding and current row
        ) as t30d_docs_active,

        sum(docs_count_sessions) over (
            partition by account_id
            order by date_day
            rows between 29 preceding and current row
        ) as t30d_docs_sessions,

        sum(docs_time_engaged_in_s) over (
            partition by account_id
            order by date_day
            rows between 29 preceding and current row
        ) as t30d_docs_time_engaged_in_s,

        sum(count_semantic_layer_queries) over (
            partition by account_id
            order by date_day
            rows between 29 preceding and current row
        ) as t30d_semantic_layer_queries,

        sum(total_job_runs) over (
            partition by account_id
            order by date_day
            rows between 29 preceding and current row
        ) as t30d_job_runs,

        sum(successful_job_runs) over (
            partition by account_id
            order by date_day
            rows between 29 preceding and current row
        ) as t30d_job_runs_successful,

        sum(failed_job_runs) over (
            partition by account_id
            order by date_day
            rows between 29 preceding and current row
        ) as t30d_job_runs_failed,

        sum(count_semantic_layer_environments_created) over (
            partition by account_id
            order by date_day
            rows between unbounded preceding and current row
        ) as cumulative_semantic_layer_environments_created,

        date_day = current_date as is_last_record

    from joined

)

select * from activities
