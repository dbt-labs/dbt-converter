{% set seven_day_statuses = ['completed_invocations', 'active', 'used_core', 'used_cloud_scheduler', 'used_cloud_ide', 'used_python'] %}

with invocations as (

    select * from {{ref('fct_dbt_invocations')}}

),

days as (

    select * from {{ref('all_days')}}

),

projects as (

    select * from {{ref('fct_dbt_projects')}}

),

project_days as (

    select
        project_id,
        date_day::date as date_day
    from projects
    join days
        on days.date_day >= date_trunc('day', projects.first_run_at)
        and days.date_day <= date_trunc('day', dateadd('day', 30, projects.last_run_at))

),

activity_days as (

    select
        project_id,
        date_trunc('day', started_at)::date as date_day,
        max(cloud_account_id) as max_cloud_account_id,
        max(cloud_project_id) as max_cloud_project_id,

        min(dbt_minor_version) as intraday_dbt_minor_version,
        mode(adapter) as adapter,
        max(languages_used) as languages_used,

        max(count_changed) as changed_models,
        max(count_changed)::float / max(nullif(count_models,0)) as pct_changed,
        max(complexity) as intraday_project_complexity,

        count(*) as invocations,
        count(case when is_completed_invocation then invocation_id end) as completed_invocations,
        sum(case when product = 'core' then 1 else 0 end) as count_core_invocations,
        sum(case when distribution = 'cloud' and product = 'scheduler' then 1 else 0 end) as count_cloud_scheduler_invocations,
        sum(case when distribution = 'cloud' and product = 'ide' then 1 else 0 end) as count_cloud_ide_invocations,

        count(distinct(case when transient_user = false then user_id else null end)) as count_non_transient_users,

        max(project_count_models) as max_project_count_models,
        max(project_count_tests) as max_project_count_tests,
        max(project_count_sources) as max_project_count_sources,
        max(project_count_seeds) as max_project_count_seeds,
        max(project_count_snapshots) as max_project_count_snapshots,
        max(project_count_exposures) as max_project_count_exposures,
        max(project_count_metrics) as max_project_count_metrics,

        sum(count_models) as total_run_models,
        sum(count_error) as total_error_models,
        sum(count_succeed) as total_successful_models,
        sum(count_view_models) as total_view_models,
        sum(count_table_models) as total_table_models,
        sum(count_incremental_models) as total_incremental_models,
        sum(count_custom_materialization_models) as total_custom_materialization_models,
        sum(count_python) as total_python_models,
        sum(count_seeds) as total_seeds,
        sum(count_snapshots) as total_snapshots

    from invocations
    group by 1, 2

),

joined as (

    select
        {{ dbt_utils.generate_surrogate_key([
                'project_id',
                'date_day'
        ]) }} as id,
        project_id,
        date_day,
        max_cloud_account_id,
        max_cloud_project_id,
        intraday_dbt_minor_version,
        intraday_project_complexity,
        adapter,

        case
            when adapter in ('postgres', 'redshift', 'snowflake', 'bigquery') then 'core'
            when adapter in ('spark', 'presto') then 'fishtown_supported'
            when adapter is not null then 'community_supported'
        end as adapter_support,

        -- field used in visualization layer
        case
            when adapter_support = 'core' then adapter
            when adapter_support is not null then 'non_core'
        end as adapter_label,

        coalesce(languages_used,0) as languages_used,

        case when completed_invocations > 0 then 1 else 0 end as active,
        case when changed_models > 0 then 1 else 0 end as changed,
        case when pct_changed < 0.05 then 1 else 0 end as mature,

    --Invocation counts
        coalesce(completed_invocations, 0) as completed_invocations,
        coalesce(count_core_invocations, 0) as core_invocations,
        core_invocations > 0 as used_core,

        coalesce(count_cloud_scheduler_invocations, 0) as cloud_scheduler_invocations,
        cloud_scheduler_invocations > 0 as used_cloud_scheduler,

        coalesce(count_cloud_ide_invocations, 0) as cloud_ide_invocations,
        cloud_ide_invocations > 0 as used_cloud_ide,

        coalesce(count_non_transient_users, 0) as count_non_transient_users,

    --Project-level metrics (max)
        coalesce(max_project_count_models, 0) as max_project_count_models,
        coalesce(max_project_count_tests, 0) as max_project_count_tests,
        coalesce(max_project_count_sources, 0) as max_project_count_sources,
        coalesce(max_project_count_seeds, 0) as max_project_count_seeds,
        coalesce(max_project_count_snapshots, 0) as max_project_count_snapshots,
        coalesce(max_project_count_exposures, 0) as max_project_count_exposures,
        coalesce(max_project_count_metrics, 0) as max_project_count_metrics,
        max_project_count_metrics > 0 as has_metrics_enabled,


    --create a smooth line of project size by keeping max of last non-null run if there is a null
        coalesce(lag(max_project_count_models) ignore nulls over(partition by project_id order by date_day), 0) as max_project_count_models_smoothed,
        coalesce(lag(max_project_count_tests) ignore nulls over(partition by project_id order by date_day), 0) as max_project_count_tests_smoothed,
        coalesce(lag(max_project_count_sources) ignore nulls over(partition by project_id order by date_day), 0) as max_project_count_sources_smoothed,
        coalesce(lag(max_project_count_seeds) ignore nulls over(partition by project_id order by date_day), 0) as max_project_count_seeds_smoothed,
        coalesce(lag(max_project_count_snapshots) ignore nulls over(partition by project_id order by date_day), 0) as max_project_count_snapshots_smoothed,
        coalesce(lag(max_project_count_exposures) ignore nulls over(partition by project_id order by date_day), 0) as max_project_count_exposures_smoothed,
        coalesce(lag(max_project_count_metrics) ignore nulls over(partition by project_id order by date_day), 0) as max_project_count_metrics_smoothed,

    --Project-level model metrics (sums/counts)
        coalesce(total_run_models, 0) as total_run_models,
        coalesce(total_error_models, 0) as total_error_models,
        coalesce(total_successful_models, 0) as total_successful_models,
        coalesce(total_view_models, 0) as total_view_models,
        coalesce(total_table_models, 0) as total_table_models,
        coalesce(total_incremental_models, 0) as total_incremental_models,
        coalesce(total_custom_materialization_models, 0) as total_custom_materialization_models,
        coalesce(total_python_models, 0) as total_python_models,
        total_python_models > 0 as used_python,

        coalesce(total_seeds, 0) as total_seeds,
        coalesce(total_snapshots, 0) as total_snapshots

    from project_days
    left join activity_days using (project_id, date_day)

),

windowed as (

    select

        id,
        project_id,
        date_day,
        max_cloud_account_id,
        max_cloud_project_id,
        active,
        changed,
        mature,
        adapter,
        adapter_support
        adapter_label,
        languages_used,

    --Booleans for project
        has_metrics_enabled,
        used_core,
        used_cloud_scheduler,
        used_cloud_ide,
        used_python,

    --Invocation counts
        completed_invocations,
        core_invocations,
        cloud_scheduler_invocations,
        cloud_ide_invocations,

        count_non_transient_users,

    --Project-level metrics (max)
        max_project_count_models,
        max_project_count_tests,
        max_project_count_sources,
        max_project_count_seeds,
        max_project_count_snapshots,
        max_project_count_exposures,
        max_project_count_metrics,
        max_project_count_models_smoothed,
        max_project_count_tests_smoothed,
        max_project_count_sources_smoothed,
        max_project_count_seeds_smoothed,
        max_project_count_snapshots_smoothed,
        max_project_count_exposures_smoothed,
        max_project_count_metrics_smoothed,

    --Project-level model metrics (sums/counts)
        total_run_models,
        total_error_models,
        total_successful_models,
        total_view_models,
        total_table_models,
        total_incremental_models,
        total_custom_materialization_models,
        total_python_models,
        total_seeds,
        total_snapshots,

        min(intraday_dbt_minor_version) over (
            partition by project_id
            order by date_day
            rows between 6 preceding and current row
            ) as dbt_minor_version,

        max(intraday_project_complexity) over (
            partition by project_id
            order by date_day
            rows between 29 preceding and current row
            ) as project_complexity,

        {% for status in seven_day_statuses -%}
        
        max({{ status }}) over (
            partition by project_id
            order by date_day
            rows between 6 preceding and current row
            ) as t7d_{{ status }},
        
        {% endfor -%}

        sum(completed_invocations) over (
            partition by project_id
            order by date_day
            rows between 29 preceding and current row
            ) as t30d_completed_invocations,

        max(active) over (
            partition by project_id
            order by date_day
            rows between 29 preceding and current row
            ) as t30d_active,

        max(changed) over (
            partition by project_id
            order by date_day
            rows between 29 preceding and current row
            ) as t30d_changed,

        min(mature) over (
            partition by project_id
            order by date_day
            rows between 29 preceding and current row
            ) as t30d_mature

    from joined

),

final as (

    select 
        *,
        -- activity category (this works like our mrr categories which will 
        -- allow us to see which movement is driving WAP changes)
        case
            when t7d_active = 1 
                and date_day = min(date_day) over (
                    partition by project_id
                    order by date_day
                )
                then 'new'
            when t7d_active = 1 
                and lag(t7d_active) over (
                    partition by project_id
                    order by date_day
                ) = 0
                then 'revived'
            when t7d_active = 1
                then 'retained'
            when t7d_active = 0
                and lag(t7d_active) over (
                    partition by project_id
                    order by date_day
                ) != 0
                then 'churned'
        end as activity_category,


        sum(t7d_active) over (partition by date_day) as t7d_active_total,
        sum(t30d_active) over (partition by date_day) as t30d_active_total,

        case
            when t7d_used_core and t7d_used_cloud_scheduler and t7d_used_cloud_ide
                then 'triple threat'
            when t7d_used_core and t7d_used_cloud_scheduler and not (t7d_used_cloud_ide)
                then 'core + scheduler'
            when t7d_used_core and not (t7d_used_cloud_scheduler) and t7d_used_cloud_ide
                then 'core + ide'
            when t7d_used_core and not (t7d_used_cloud_scheduler) and not (t7d_used_cloud_ide)
                then 'core only'
            when not (t7d_used_core) and t7d_used_cloud_scheduler and not (t7d_used_cloud_ide)
                then 'scheduler only'
            when not (t7d_used_core) and t7d_used_cloud_scheduler and t7d_used_cloud_ide
                then 'scheduler + ide'
            when not (t7d_used_core) and not (t7d_used_cloud_scheduler) and t7d_used_cloud_ide
                then 'ide only'
            else 'other'
        end as dbt_product_mix

    from windowed

)

select * from final
