

with days as (

    select * from analytics_dev.dbt_jstein.all_days

),

licenses_daily as (

    select * from analytics_dev.dbt_jstein.stg_cloud__user_licenses_snapshot_daily

),

cloud_mappings as (

    select * from analytics_dev.dbt_jstein.cloud_account_mappings

),

users as (

    select * from analytics_dev.dbt_jstein.fct_cloud_users

),

ide_events as (

    select * from analytics_dev.dbt_jstein.fct_cloud_ide_sessions

),

pageviews as (

    select * from analytics_dev.dbt_jstein.fct_web_pageviews

),

docs as (

    select * from analytics_dev.dbt_jstein.dbt_docs_sessions

),

metadata_daily_user_activity as (

    select * from analytics_dev.dbt_jstein.metadata_daily_user_activity

),

ide_events_conformed as (

    select
        
    
md5(cast(coalesce(cast(user_id as TEXT), '') || '-' || coalesce(cast(account_id as TEXT), '') || '-' || coalesce(cast(created_at::date as TEXT), '') as TEXT)) as id,

        account_id,
        user_id,
        created_at::date as date_day,

        sum(is_successful_session) as ide_count_develop_sessions,
        sum(is_failed_session) as ide_count_failed_develop_sessions,
        count(develop_request_id) as ide_count_total_sessions,
        sum(count_tab_views) as ide_count_tab_views,
        sum(count_invocations) as ide_count_dbt_invocations,
        sum(count_operations) as ide_count_dbt_queries_run,
        sum(count_page_refreshes) as ide_count_page_refreshes,
        sum(time_engaged_in_s) as ide_time_engaged_in_s

    from ide_events
    group by 1,2,3,4

),

deployment_events_conformed as (

    select
        
    
md5(cast(coalesce(cast(user_custom_id as TEXT), '') || '-' || coalesce(cast(cloud_account_id as TEXT), '') || '-' || coalesce(cast(page_view_start::date as TEXT), '') as TEXT)) as id,

        cloud_account_id as account_id,
        user_custom_id as user_id,
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
        sum(case when page_url_fragment like '%/environment-variables/%' then 1 else 0 end) as deployment_count_environment_variables_pageviews,
        sum(case when page_url_fragment like '%/runs/%' then time_engaged_in_s else 0 end) as deployment_run_history_time_engaged_in_s,
        sum(case when page_url_fragment like '%/sources/%' then time_engaged_in_s else 0 end) as deployment_snapshot_freshness_time_engaged_in_s,
        sum(case 
                when page_url_fragment not like '%/runs/%' 
                and page_url_fragment not like '%/sources/%' 
            then time_engaged_in_s else 0 end
        ) as deployment_administrative_time_engaged_in_s,
        sum(
            case 
                when page_url_fragment like '%/environment-variables/%' 
                then time_engaged_in_s 
                else 0 
            end
        ) as deployment_environment_variables_time_engaged_in_s

    from pageviews
    where user_custom_id is not null
      and cloud_account_id is not null
      and cloud_page_type = 'scheduled run'
    group by 1,2,3,4

),

setup_events_conformed as (

    select
        
    
md5(cast(coalesce(cast(user_custom_id as TEXT), '') || '-' || coalesce(cast(cloud_account_id as TEXT), '') || '-' || coalesce(cast(page_view_start::date as TEXT), '') as TEXT)) as id,

        cloud_account_id as account_id,
        user_custom_id as user_id,
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
    group by 1,2,3,4

),

overall_engagement_conformed as (

    select
        
    
md5(cast(coalesce(cast(user_custom_id as TEXT), '') || '-' || coalesce(cast(cloud_account_id as TEXT), '') || '-' || coalesce(cast(page_view_start::date as TEXT), '') as TEXT)) as id,

        user_custom_id as user_id,
        cloud_account_id as account_id,
        page_view_start::date as date_day,

        count(*) as total_count_pageviews,
        sum(time_engaged_in_s) as total_time_engaged_in_s

    from pageviews
    group by 1,2,3,4

),

docs_sessions_conformed as (

    select
        
    
md5(cast(coalesce(cast(inferred_user_id as TEXT), '') || '-' || coalesce(cast(cloud_account_id as TEXT), '') || '-' || coalesce(cast(session_start::date as TEXT), '') as TEXT)) as id,

        inferred_user_id as user_id,
        cloud_account_id as account_id,
        session_start::date as date_day,

        count(*) as docs_count_sessions,
        sum(time_engaged_in_s) as docs_time_engaged_in_s

    from docs
    where cloud_account_id is not null
    and session_start is not null
    group by 1,2,3,4

),

spine as (

    select
        
    
md5(cast(coalesce(cast(users.user_id as TEXT), '') || '-' || coalesce(cast(licenses_daily.account_id as TEXT), '') || '-' || coalesce(cast(days.date_day::date as TEXT), '') as TEXT)) as id,

        licenses_daily.account_id,
        users.user_id,
        users.salesforce_contact_id,
        users.email,
        users.database_type,
        days.date_day,

        days.date_day = users.date_joined__ntz::date as is_user_first_day,
        datediff(day, users.date_joined__ntz, days.date_day) as days_since_user_first_day,

        licenses_daily.license_type as user_license_type,
        licenses_daily.is_user_license_deleted as is_user_deleted_from_account

    from days
    join licenses_daily
        on days.date_day = licenses_daily.date_day
    join users
        on users.user_id = licenses_daily.user_id
        and days.date_day = licenses_daily.date_day

    where days.date_day <= current_date()

),

joined as (

    select
        spine.*,
        cloud_mappings.salesforce_account_id,
        cloud_mappings.sfdc_parent_account_id,
        cloud_mappings.stripe_customer_id,
        cloud_mappings.customer_id,
        cloud_mappings.is_paying_account,
        cloud_mappings.is_primary_cloud_account,
        cloud_mappings.plan,

        -- overall_engagement_conformed
        coalesce(total_count_pageviews, 0) as total_count_pageviews,
        coalesce(total_time_engaged_in_s, 0) as total_time_engaged_in_s,

        -- ide_events_conformed
        coalesce(ide_count_develop_sessions, 0) as ide_count_develop_sessions,
        coalesce(ide_count_failed_develop_sessions, 0) as ide_count_failed_develop_sessions,
        coalesce(ide_count_tab_views, 0) as ide_count_tab_views,
        coalesce(ide_count_dbt_invocations, 0) as ide_count_dbt_invocations,
        coalesce(ide_count_dbt_queries_run, 0) as ide_count_dbt_queries_run,
        coalesce(ide_count_page_refreshes, 0) as ide_count_page_refreshes,
        coalesce(ide_time_engaged_in_s, 0) as ide_time_engaged_in_s,
        coalesce(ide_count_total_sessions, 0) as ide_count_total_sessions,

        -- deployment_events_conformed
        coalesce(deployment_count_pageviews, 0) as deployment_count_pageviews,
        coalesce(deployment_time_engaged_in_s, 0) as deployment_time_engaged_in_s,
        coalesce(deployment_count_run_history_pageviews, 0) as deployment_count_run_history_pageviews,
        coalesce(deployment_count_run_history_pageviews, 0) as deployment_count_snapshot_freshness_pageviews,
        coalesce(deployment_count_administrative_pageviews, 0) as deployment_count_administrative_pageviews,
        coalesce(deployment_count_environment_variables_pageviews, 0) as deployment_count_environment_variables_pageviews,
        coalesce(deployment_run_history_time_engaged_in_s, 0) as deployment_run_history_time_engaged_in_s,
        coalesce(deployment_run_history_time_engaged_in_s, 0) as deployment_snapshot_freshness_time_engaged_in_s,
        coalesce(deployment_administrative_time_engaged_in_s, 0) as deployment_administrative_time_engaged_in_s,
        coalesce(deployment_environment_variables_time_engaged_in_s, 0) as deployment_environment_variables_time_engaged_in_s,

        -- setup_events_conformed
        coalesce(setup_count_pageviews, 0) as setup_count_pageviews,
        coalesce(setup_count_invite_pageviews, 0) as setup_count_invite_pageviews,
        coalesce(setup_count_project_pageviews, 0) as setup_count_project_pageviews,
        coalesce(setup_count_connection_pageviews, 0) as setup_count_connection_pageviews,
        coalesce(setup_count_environment_pageviews, 0) as setup_count_environment_pageviews,
        coalesce(setup_count_repo_pageviews, 0) as setup_count_repo_pageviews,

        --docs_sessions_conformed
        coalesce(docs_count_sessions, 0) as docs_count_sessions,
        coalesce(docs_time_engaged_in_s, 0) as docs_time_engaged_in_s,

        -- metadata_daily_user_activity
        coalesce(total_metadata_api_requests, 0) as total_metadata_api_requests,
        coalesce(total_model_bottleneck_viz_events, 0) as total_model_bottleneck_viz_events,

        -- activity flags
        case when total_count_pageviews > 0 then 1 else 0 end as is_active,
        case when deployment_count_pageviews > 0 then 1 else 0 end as is_active_scheduled_runs,
        case when ide_count_develop_sessions > 0 then 1 else 0 end as is_active_ide,
        case when round((ide_time_engaged_in_s/60),0) >= 10 then 1 else 0 end as is_ide_engaged_for_10min,

        case when docs_count_sessions > 0 then 1 else 0 end as is_active_docs,
        case when deployment_count_snapshot_freshness_pageviews > 0 then 1 else 0 end as is_active_snapshot_freshness,
        case when deployment_count_environment_variables_pageviews > 0 then 1 else 0 end as is_active_environment_variables,
        case when total_metadata_api_requests > 0 then 1 else 0 end as is_active_metadata_api_requests,
        case when total_model_bottleneck_viz_events > 0 then 1 else 0 end as is_active_model_bottleneck_viz,
        case when setup_count_invite_pageviews > 0 then 1 else 0 end as is_active_setup_invite,
        case when setup_count_project_pageviews > 0 then 1 else 0 end as is_active_setup_project,
        case when setup_count_connection_pageviews > 0 then 1 else 0 end as is_active_setup_connection,
        case when setup_count_environment_pageviews > 0 then 1 else 0 end as is_active_setup_environment,
        case when setup_count_repo_pageviews > 0 then 1 else 0 end as is_active_setup_repo

    from spine
    left join overall_engagement_conformed using (id)
    left join ide_events_conformed using (id)
    left join deployment_events_conformed using (id)
    left join setup_events_conformed using (id)
    left join docs_sessions_conformed using (id)
    left join metadata_daily_user_activity using (id)
    left join cloud_mappings
        on spine.account_id = cloud_mappings.account_id

),

activities as (

    select
        *,

        max(case when is_active = 1 then date_day end)
            over (
            partition by user_id, account_id
        ) as last_active_date,

        date_day = last_active_date::date as is_user_last_login,

        max(is_active) over (
            partition by user_id, account_id
            order by date_day
            rows between 6 preceding and current row
        ) as t7d_active,

        max(is_active_ide) over (
            partition by user_id, account_id
            order by date_day
            rows between 6 preceding and current row
        ) as t7d_ide_active,

        sum(ide_count_develop_sessions) over (
            partition by user_id, account_id
            order by date_day
            rows between 6 preceding and current row
        ) as t7d_ide_sessions,

        sum(ide_time_engaged_in_s) over (
            partition by user_id, account_id
            order by date_day
            rows between 6 preceding and current row
        ) as t7d_ide_time_engaged_in_s,

        max(is_active_docs) over (
            partition by user_id, account_id
            order by date_day
            rows between 6 preceding and current row
        ) as t7d_docs_active,

        sum(docs_count_sessions) over (
            partition by user_id, account_id
            order by date_day
            rows between 6 preceding and current row
        ) as t7d_docs_sessions,

        sum(docs_time_engaged_in_s) over (
            partition by user_id, account_id
            order by date_day
            rows between 6 preceding and current row
        ) as t7d_docs_time_engaged_in_s,

    -- trailing 30 day
        max(is_active) over (
            partition by user_id, account_id
            order by date_day
            rows between 29 preceding and current row
        ) as t30d_active,

        max(is_active_ide) over (
            partition by user_id, account_id
            order by date_day
            rows between 29 preceding and current row
        ) as t30d_ide_active,

        sum(ide_count_develop_sessions) over (
            partition by user_id, account_id
            order by date_day
            rows between 29 preceding and current row
        ) as t30d_ide_sessions,

        sum(ide_time_engaged_in_s) over (
            partition by user_id, account_id
            order by date_day
            rows between 29 preceding and current row
        ) as t30d_ide_time_engaged_in_s,

        max(is_active_docs) over (
            partition by user_id, account_id
            order by date_day
            rows between 29 preceding and current row
        ) as t30d_docs_active,

        max(is_active_docs) over (
            partition by user_id, account_id
            order by date_day
            rows between 89 preceding and current row
        ) as t90d_docs_active,

        sum(docs_count_sessions) over (
            partition by user_id, account_id
            order by date_day
            rows between 29 preceding and current row
        ) as t30d_docs_sessions,

        sum(docs_time_engaged_in_s) over (
            partition by user_id, account_id
            order by date_day
            rows between 29 preceding and current row
        ) as t30d_docs_time_engaged_in_s,

        sum(docs_time_engaged_in_s) over (
            partition by user_id, account_id
            order by date_day
            rows between 89 preceding and current row
        ) as t90d_docs_time_engaged_in_s,

        date_day = current_date as is_last_record

    from joined

)

select * from activities