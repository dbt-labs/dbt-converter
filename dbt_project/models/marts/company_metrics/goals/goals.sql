with

goals as (

    select * from {{ref('kpi_goals__new_waps')}}

),

all_days_source as (

    select * from {{ref('all_days')}}

),

all_days as (

    select
        date_day,
        date_trunc('month', date_day)::date as date_month,
        extract(day from (last_day(date_day))) as total_days_in_month

    from all_days_source

),


joined as (

    select
        goals.metric_name,
        all_days.date_day,
        all_days.total_days_in_month,
        goals.goal

    from all_days
    left join goals
        on all_days.date_month = goals.month::date

),

final as (

    select
        {{dbt_utils.generate_surrogate_key([
          'metric_name',
          'date_day'
        ])}} as id,
        metric_name,
        date_day,
        goal/total_days_in_month as metric_goal

    from joined

)

select * from final
