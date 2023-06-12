with

source as (

    select * from {{ref('metric__new_waps')}}

),

days as (

    select * from {{ref('all_days')}}

),

metric_names as (

    select distinct
        metric_name

    from source

),

filled as (

    select * from days
    cross join metric_names

),

joined as (

    select
        {{dbt_utils.generate_surrogate_key([
            'filled.metric_name',
            'filled.date_day'
        ])}} as id,
        filled.metric_name,
        filled.date_day,
        filled.fiscal_year,
        filled.fiscal_quarter_num,
        filled.fiscal_quarter_date,

        case
            when filled.date_day < current_date
                then coalesce(metric_value, 0)
            else null
        end as metric_value

    from filled
    left join source
      on filled.metric_name = source.metric_name
      and filled.date_day = source.date_day

)

select * from joined
