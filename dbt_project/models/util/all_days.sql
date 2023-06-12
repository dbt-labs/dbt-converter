with

date_spine as (

    {{ dbt_utils.date_spine(
        datepart="day",
        start_date="to_date('01/01/2016', 'mm/dd/yyyy')",
        end_date="dateadd(year, 4, current_date)"
    )
    }}

),

fiscal_adjustments as (

    select
        *,

        {{ fiscal_year('date_day') }} as fiscal_year,
        {{ fiscal_quarter_number('date_day') }} as fiscal_quarter_num,
        {{ fiscal_quarter('date_day') }} as fiscal_quarter,
        {{ fiscal_half_year('date_day') }} as fiscal_half_year,
        {{ fiscal_quarter_start_date('date_day') }} as fiscal_quarter_date

    from date_spine

),

with_booleans as (

    select
        *,

        extract(day from date_day) = 1 as is_first_day_of_month,

        coalesce(
            date_day = last_day(date_day),
            false
        ) as is_last_day_of_month,

        last_day(date_day, 'month')::string as applicable_month_end,

        rank() over (
            partition by fiscal_year, fiscal_quarter_num
            order by date_day) = 1
        as is_first_day_of_fiscal_quarter,

        rank() over (
                partition by fiscal_year, fiscal_quarter_num
                order by date_day desc) = 1
        as is_last_day_of_fiscal_quarter

    from fiscal_adjustments

)

select * from with_booleans