with

raw_source as (

    select * from {{ref('fct_dbt_project_activity')}}

),

metric_agg as (

    select
        date_day,
        sum(t7d_active) as total_7d_active

    from raw_source
    group by 1

),

metric_lagged as (

    select
        *,
        lag(total_7d_active) over (
            order by date_day
        ) as prev_7d_active

    from metric_agg

),

metric_source as (

    select
        date_day,
        'new dbt WAPs' as metric_name,
        (total_7d_active - coalesce(prev_7d_active,0)) as metric_value

    from metric_lagged

)

select * from metric_source
