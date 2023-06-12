--use macro to create one row per hour per day
with hours as (

    {{ dbt_utils.date_spine(
        datepart="hour",
        start_date="to_date('01/01/2018', 'mm/dd/yyyy')",
        end_date="dateadd(month, 1, current_date)"
       )
    }}

),

amer_holidays as (

    select * from {{ ref('stg_support_holidays_amer') }}

),

emea_holidays as (

    select * from {{ ref('stg_support_holidays_emea') }}

),

apac_holidays as (

    select * from {{ ref('stg_support_holidays_apac') }}

),


--convert hour to EST
converted_hours as (

    select distinct

        convert_timezone(
            'UTC',
            date_hour
        )::timestamp_ntz as date_hour

    from hours
),


--the output of this CTE is two columns: the first is one row for every hour of
--the day date spine (from above). the second returns the same result if it falls
--within our support hours. in the future, as support potentially changes,
--this is where we will alter biz hours

business_hours as (

    select
        date_hour,
        amer_holidays.description is not null as is_amer_holiday,
        convert_timezone('America/New_York','America/New_York',date_hour) as amer_hour,
        dayofweek(amer_hour) as amer_day_of_week,

        apac_holidays.description is not null as is_apac_holiday,
        convert_timezone('America/New_York','Australia/Sydney',date_hour) as apac_hour,
        dayofweek(apac_hour) as apac_day_of_week,

        emea_holidays.description is not null as is_emea_holiday,
        convert_timezone('America/New_York','Europe/Berlin',date_hour) as emea_hour,
        dayofweek(emea_hour) as emea_day_of_week,

        case
--before we hired a rep in MST (M-F, 8am - 5pm EST)
            when date_hour::date < '2020-09-14'
                and dayofweek(date_hour) not in (0,6)
                and hour(date_hour) between 8 and 16
                and amer_holidays.date is null
                    then converted_hours.date_hour

--after we hired a rep in MST  (M-F, 8am - 8pm EST)
            when date_hour::date between '2020-09-14' and  '2021-09-01'
                and dayofweek(date_hour) not in (0,6)
                and hour(date_hour) between 8 and 19
                and amer_holidays.date is null
                    then converted_hours.date_hour

-- after we hired international reps
-- Support Hours are:
-- 8AM-8PM M-F in Sydney, Berlin, and New York
-- Except Australia, UK, and US Federal Holidays

            when date_hour::date >=  '2021-09-01'
                and (
                    ( 
                    apac_day_of_week between 1 and 5
                    and hour(apac_hour) between 8 and 19
                    and not is_apac_holiday
                    )
                    or ( 
                    emea_day_of_week between 1 and 5
                    and hour(emea_hour) between 8 and 19
                    and not is_emea_holiday
                    ) 
                    or ( 
                    amer_day_of_week between 1 and 5
                    and hour(amer_hour) between 8 and 19
                    and not is_amer_holiday
                    ) 
                )
                    then converted_hours.date_hour

        end as business_hour

    from converted_hours

    left join amer_holidays
        on date_trunc(
            day, 
            date_hour
        )::date = to_date(amer_holidays.date)

    left join emea_holidays
        on date_trunc(
            day, 
            convert_timezone('America/New_York','Europe/Berlin',date_hour)
        )::date = to_date(emea_holidays.date)

    left join apac_holidays
        on date_trunc(
            day, 
            convert_timezone('America/New_York','Australia/Sydney',date_hour)
        )::date = to_date(apac_holidays.date)),

--the output of this CTE adds an additional column to fill in missing values
--the purpose is to show 8am for times outside of business hours
--ex. 10:36pm at night will show 8:00am the next day
corrections as (

    select

        *,
        business_hour is not null as is_business_hour,
        lead(business_hour) ignore nulls over (
            partition by 1
            order by date_hour
        ) as adjusted_business_hour

     from business_hours

),

--this cleans up the extra columns to properly calculate business hours.
--the result is one row for every hour of every day with a mapped business hour.
final as (

    select

        date_hour,
        coalesce(business_hour, adjusted_business_hour) as business_hour,
        is_business_hour

    from corrections

)

select *
from final
