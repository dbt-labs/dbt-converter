
  
    

        create or replace transient table analytics_dev.dbt_jstein.fct_cloud_ide_sessions  as
        (

with ide_sessions as (

    select * from analytics_dev.dbt_jstein.stg_cloud__develop_requests

),

invocations as (

    select * from analytics_dev.dbt_jstein.stg_dbt_cloud_ide_invocation

),

operations as (

    select * from analytics_dev.dbt_jstein.stg_dbt_cloud_ide_sql_operation

),

tab_views as (

    select * from analytics_dev.dbt_jstein.stg_dbt_cloud_ide_tab_view

),

page_views as (

    select * from analytics_dev.dbt_jstein.fct_web_pageviews

),

ide_dag_sessions as (

    select * from analytics_dev.dbt_jstein.int_ide_dag_sessions

),

dag_in_ide_usage as (

    select
        develop_request_id,
        count(*) as dag_in_ide_sessions

    from ide_dag_sessions
    group by 1

),

page_view_to_develop_request_map as (

    -- we take the latest develop_request_id for each page_view
    -- from the tab_view event

    select
        page_view_id,
        max(develop_request_id) as develop_request_id

    from tab_views
    group by 1

),

invocations_agg as (

    select
        develop_request_id,
        sum(case when develop_request_id is not null then 1 else 0 end) as count_invocations,
        sum(case when is_success then 1 else 0 end) as count_successful_invocations,
        min(case when is_success then event_at else null end) as successful_invocation_start_time,
        sum(invocation_runtime_in_seconds) as invocation_runtime_in_seconds

    from invocations
    group by 1

),

operations_agg as (

    select
        develop_request_id,
        sum(case when develop_request_id is not null then 1 else 0 end) as count_operations,
        sum(case when operation_type = 'compile_sql' then 1 else 0 end) as count_compile_sql_operations,
        sum(case when operation_type = 'run_sql' then 1 else 0 end) as count_run_sql_operations,
        sum(operation_runtime_in_seconds) as operation_runtime_in_seconds

    from operations
    group by 1

),

tab_views_agg as (

    select
        develop_request_id,
        sum(case when develop_request_id is not null then 1 else 0 end) as count_tab_views,
        count(distinct tab_name) as count_distinct_tabs_viewed

    from tab_views
    group by 1

),

page_views_agg as (

    select
        map.develop_request_id,
        count(*) as count_page_views,
        sum(case when is_refresh then 1 else 0 end) as count_page_refreshes,
        sum(time_engaged_in_s) as time_engaged_in_s

    from page_view_to_develop_request_map as map
    join page_views on map.page_view_id = page_views.page_view_id
    group by 1

),

final as (

    select
        ide_sessions.*,
        coalesce(tab_views_agg.count_tab_views, 0) as count_tab_views,
        coalesce(tab_views_agg.count_distinct_tabs_viewed, 0) as count_distinct_tabs_viewed,
        coalesce(invocations_agg.count_invocations, 0) as count_invocations,
        coalesce(invocations_agg.count_successful_invocations, 0) as count_successful_invocations,
        successful_invocation_start_time,
        coalesce(invocations_agg.invocation_runtime_in_seconds, 0) as invocation_runtime_in_seconds,
        
        coalesce(operations_agg.count_operations, 0) as count_operations,
        coalesce(operations_agg.count_compile_sql_operations, 0) as count_compile_sql_operations,
        coalesce(operations_agg.count_run_sql_operations, 0) as count_run_sql_operations,
        coalesce(operations_agg.operation_runtime_in_seconds, 0) as operation_runtime_in_seconds,

        coalesce(count_page_views, 0) as count_page_views,
        coalesce(count_page_refreshes, 0) as count_page_refreshes,
        coalesce(time_engaged_in_s, 0) as time_engaged_in_s,

        coalesce(dag_in_ide_sessions, 0) > 0 as has_used_dag_in_session,
        row_number() over (
            partition by user_id
            order by created_at
        ) as user_session_index,
        count(case when is_successful_session = 1 then develop_request_id else null end) over (
            partition by user_id
            order by created_at
        ) as user_successful_session_index

    from ide_sessions
    left join tab_views_agg using (develop_request_id)
    left join invocations_agg using (develop_request_id)
    left join operations_agg using (develop_request_id)
    left join page_views_agg using (develop_request_id)
    left join dag_in_ide_usage using (develop_request_id)

)

select * from final
        );
      
  