with

date_spine as (

    





with rawdata as (

    

    

    with p as (
        select 0 as generated_number union all select 1
    ), unioned as (

    select

    
    p0.generated_number * power(2, 0)
     + 
    
    p1.generated_number * power(2, 1)
     + 
    
    p2.generated_number * power(2, 2)
     + 
    
    p3.generated_number * power(2, 3)
     + 
    
    p4.generated_number * power(2, 4)
     + 
    
    p5.generated_number * power(2, 5)
     + 
    
    p6.generated_number * power(2, 6)
     + 
    
    p7.generated_number * power(2, 7)
     + 
    
    p8.generated_number * power(2, 8)
     + 
    
    p9.generated_number * power(2, 9)
     + 
    
    p10.generated_number * power(2, 10)
     + 
    
    p11.generated_number * power(2, 11)
     + 
    
    p12.generated_number * power(2, 12)
    
    
    + 1
    as generated_number

    from

    
    p as p0
     cross join 
    
    p as p1
     cross join 
    
    p as p2
     cross join 
    
    p as p3
     cross join 
    
    p as p4
     cross join 
    
    p as p5
     cross join 
    
    p as p6
     cross join 
    
    p as p7
     cross join 
    
    p as p8
     cross join 
    
    p as p9
     cross join 
    
    p as p10
     cross join 
    
    p as p11
     cross join 
    
    p as p12
    
    

    )

    select *
    from unioned
    where generated_number <= 4177
    order by generated_number



),

all_periods as (

    select (
        

    dateadd(
        day,
        row_number() over (order by 1) - 1,
        to_date('01/01/2016', 'mm/dd/yyyy')
        )


    ) as date_day
    from rawdata

),

filtered as (

    select *
    from all_periods
    where date_day <= dateadd(year, 4, current_date)

)

select * from filtered



),

fiscal_adjustments as (

    select
        *,

        

    case
        when extract(month from date_day )  < 2
            then extract(year from date_day )
        else extract(year from date_day ) + 1
    end
    

 as fiscal_year,
        

    case
        when extract(month from date_day ) between 2 and 4
            then 1
        when extract(month from date_day ) between 5 and 7
            then 2
        when extract(month from date_day ) between 8 and 10
            then 3
        else 4
    end
        

 as fiscal_quarter_num,
        

    (

    case
        when extract(month from date_day )  < 2
            then extract(year from date_day )
        else extract(year from date_day ) + 1
    end
    

 || ' Q' || 

    case
        when extract(month from date_day ) between 2 and 4
            then 1
        when extract(month from date_day ) between 5 and 7
            then 2
        when extract(month from date_day ) between 8 and 10
            then 3
        else 4
    end
        

)

 as fiscal_quarter,
        

    case
        when 

    case
        when extract(month from date_day ) between 2 and 4
            then 1
        when extract(month from date_day ) between 5 and 7
            then 2
        when extract(month from date_day ) between 8 and 10
            then 3
        else 4
    end
        

 <= 2
            then ( 

    case
        when extract(month from date_day )  < 2
            then extract(year from date_day )
        else extract(year from date_day ) + 1
    end
    

 || ' H1' )
        when 

    case
        when extract(month from date_day ) between 2 and 4
            then 1
        when extract(month from date_day ) between 5 and 7
            then 2
        when extract(month from date_day ) between 8 and 10
            then 3
        else 4
    end
        

 > 2
            then ( 

    case
        when extract(month from date_day )  < 2
            then extract(year from date_day )
        else extract(year from date_day ) + 1
    end
    

 || ' H2' )
    end

 as fiscal_half_year,
        

    min(dateadd(year,1, date_trunc('month', date_day ))) over (
    partition by 

    case
        when extract(month from date_day ) between 2 and 4
            then 1
        when extract(month from date_day ) between 5 and 7
            then 2
        when extract(month from date_day ) between 8 and 10
            then 3
        else 4
    end
        

, 

    case
        when extract(month from date_day )  < 2
            then extract(year from date_day )
        else extract(year from date_day ) + 1
    end
    


    order by date_day)

 as fiscal_quarter_date

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