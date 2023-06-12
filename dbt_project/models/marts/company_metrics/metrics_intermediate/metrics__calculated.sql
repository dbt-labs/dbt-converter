with

source as (

    select * from {{ref('metrics__filled')}}

),

xf as (

    select
        *,
        date_trunc('month', date_day) as date_month,
        fiscal_quarter_date as date_fiscal_quarter,
        extract(day from date_day) as day_of_month,
        extract(month from date_day) as month_of_year,
        fiscal_quarter_num as quarter_of_fiscal_year

    from source

),

windowed as (

    select
        *,
        row_number() over (
            partition by metric_name,date_fiscal_quarter
            order by date_day
        ) as day_of_fiscal_quarter,
        sum(metric_value) over (
            partition by metric_name
            order by date_day
            rows between 6 preceding and current row
        ) as t7d_metric_total,

        avg(metric_value) over (
            partition by metric_name
            order by date_day
            rows between 6 preceding and current row
        ) as t7d_metric_avg,

        sum(metric_value) over (
            partition by metric_name
            order by date_day
            rows between 29 preceding and current row
        ) as t30d_metric_total,

        avg(metric_value) over (
            partition by metric_name
            order by date_day
            rows between 29 preceding and current row
        ) as t30d_metric_avg,

        sum(metric_value) over (
            partition by metric_name, date_month
            order by day_of_month
            rows between unbounded preceding and current row
        ) as cm_cumulative_metric_total,

        avg(metric_value) over (
            partition by metric_name, date_month
            order by day_of_month
            rows between unbounded preceding and current row
        ) as cm_cumulative_metric_avg,

        sum(metric_value) over (
            partition by metric_name, date_fiscal_quarter
            order by date_day
            rows between unbounded preceding and current row
        ) as cq_cumulative_metric_total,

        avg(metric_value) over (
            partition by metric_name, date_fiscal_quarter
            order by date_day
            rows between unbounded preceding and current row
        ) as cq_cumulative_metric_avg

    from xf

),

lagged as (

    select
        *,
        case
            when lag(month_of_year) over (
              partition by metric_name, day_of_month
              order by date_month
            ) in (12, month_of_year - 1)
            then lag(cm_cumulative_metric_total) over (
              partition by metric_name, day_of_month
              order by date_month
            )
            else null
        end as lm_cumulative_metric_total, --last month metric

        lag(cm_cumulative_metric_total) over (
            partition by metric_name, day_of_month, month_of_year
            order by fiscal_year
        ) as lytm_cumulative_metric_total, --last year, this month metric

        lag(cq_cumulative_metric_total) over (
              partition by metric_name, day_of_fiscal_quarter
              order by date_day
        ) as lq_cumulative_metric_total, --last quarter metric

        lag(cq_cumulative_metric_total) over (
            partition by metric_name, day_of_month, month_of_year, quarter_of_fiscal_year
            order by fiscal_year
        ) as lytq_cumulative_metric_total --last year, this quarter metric

    from windowed

),

null_corrected as (

    select
        id,
        metric_name,
        date_day,
        metric_value,
        day_of_month,
        month_of_year,
        quarter_of_fiscal_year,
        fiscal_year,
        t7d_metric_total,
        t7d_metric_avg,
        t30d_metric_total,
        t30d_metric_avg,
        cm_cumulative_metric_total,
        cm_cumulative_metric_avg,
        cq_cumulative_metric_total,
        cq_cumulative_metric_avg,

        case
            when lm_cumulative_metric_total is not null
                then lm_cumulative_metric_total
            else lag(lm_cumulative_metric_total) ignore nulls over (
                partition by metric_name
                order by date_day
                )
        end as lm_cumulative_metric_total,

        lq_cumulative_metric_total,
        lytm_cumulative_metric_total,
        lytq_cumulative_metric_total

    from lagged

)

select * from null_corrected
