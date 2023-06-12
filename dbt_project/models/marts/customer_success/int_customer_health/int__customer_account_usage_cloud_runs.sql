{% set t7d_logic = 'date_day between dateadd(day, -8, current_date()) and dateadd(day, -1, current_date())'%}
{% set t7to14d_logic = 'date_day between dateadd(day, -15, current_date()) and dateadd(day, -8, current_date())'%}
{% set t30d_logic = 'date_day between dateadd(day, -31, current_date()) and dateadd(day, -1, current_date())'%}
{% set t30to90d_logic = 'date_day between dateadd(day, -91, current_date()) and dateadd(day, -31, current_date())'%}
{% set t90d_logic = 'date_day between dateadd(day, -91, current_date()) and dateadd(day, -1, current_date())'%}

with

runs as (

    select * from {{ ref('fct_cloud_run_metrics') }}

),

mappings as (

    select * from {{ ref('cloud_account_mappings') }}
    where is_current_paying_account

),

joined as (

    select
        mappings.customer_id,
        runs.*
    from runs
    inner join mappings using (account_id)

),

runs_agg as (

    select 
        created_at::date as date_day,
        customer_id,
        count(*) as runs,
        count(case when is_successful_session and type = 'cloud_run' then unique_id end) as runs_successful,
        count(case when is_failed_session and type = 'cloud_run' then unique_id end) as runs_failed,

        count(case when type = 'cloud_run' then unique_id end) as job_runs,
        count(case when is_successful_session and type = 'cloud_run' then unique_id end) as job_runs_successful,
        count(case when is_failed_session and type = 'cloud_run' then unique_id end) as job_runs_failed,

        count(case when type = 'develop_request' then unique_id end) as ide_sessions,
        count(case when is_successful_session and type = 'develop_request' then unique_id end) as ide_sessions_successful,
        count(case when is_failed_session and type = 'develop_request' then unique_id end) as ide_sessions_failed

    from joined
    group by 1,2

),

trailing_run_metrics as (

    select
        customer_id
    {%-
        set run_types =['runs',
            'runs_successful',
            'runs_failed',
            'job_runs',
            'job_runs_successful',
            'job_runs_failed',
            'ide_sessions',
            'ide_sessions_successful',
            'ide_sessions_failed']
    -%}

    {% for run_type in run_types -%}

       ,sum(
            case when {{ t7d_logic }}
            then {{run_type}} else 0 end
        ) as t7d_{{run_type}}

       ,sum(
            case when {{ t7to14d_logic }}
            then {{run_type}} else 0 end
        ) as prev_t7d_{{run_type}}

        ,sum(
            case when {{ t30d_logic }}
            then {{run_type}} else 0 end
        ) as t30d_{{run_type}}

        ,sum(
            case when {{ t30to90d_logic }}
            then {{run_type}} else 0 end
        ) as prev_t30d_{{run_type}}

        ,sum(
            case when {{ t90d_logic }}
            then {{run_type}} else 0 end
        ) as t90d_{{run_type}}

    {%- endfor %}

    from runs_agg
    group by 1

),

pct_changes as (

    select
        *

    {%-
        set run_metrics =[
            'job_runs',
            'job_runs_successful',
            'ide_sessions',
            'ide_sessions_successful'
            ]
    -%}

    {% for run_metric in run_metrics -%}

        ,round(
            ((t7d_{{ run_metric }} - prev_t7d_{{ run_metric }}) / nullif(prev_t7d_{{ run_metric }},0)),
            2
        ) as t7d_{{ run_metric }}_pct_change

        ,round(
            ((t30d_{{ run_metric }} - prev_t7d_{{ run_metric }}) / nullif(prev_t30d_{{ run_metric }},0)),
            2
        ) as t30d_{{ run_metric }}_pct_change

    {%- endfor %}

    from trailing_run_metrics

)

select * from pct_changes