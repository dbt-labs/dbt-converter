with

base as (
    
    select * from {{ ref('stg_googlesheets__proserv_utilization_targets')}}
    
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

regions_joined as (
    
    select distinct
    
        base.*,
        count(distinct 
                case 
                    when date_trunc(week,amer_holidays.date::date) = base.week_start
                        then amer_holidays.date 
                    else null 
                end)
                over(partition by name, base.week_start)
            as amer_holidays,
        
        count(distinct 
                case 
                    when date_trunc(week,emea_holidays.date::date) = base.week_start
                        then emea_holidays.date 
                    else null 
                end)
                over(partition by name, base.week_start)
            as emea_holidays,
        
        count(distinct 
                case 
                    when date_trunc(week,apac_holidays.date::date) = base.week_start
                        then apac_holidays.date 
                    else null 
                end)
                over(partition by name, base.week_start)
            as apac_holidays
        
    from base
    left join amer_holidays
        on date_trunc(week,amer_holidays.date::date) = base.week_start
    left join emea_holidays
        on date_trunc(week,emea_holidays.date::date) = base.week_start
    left join apac_holidays
        on date_trunc(week,apac_holidays.date::date) = base.week_start
       
),

calculated as (
    
    select
    
        regions_joined.*,
        case
            when region = 'EMEA'
                then total_days - individual_non_working_days - emea_holidays
            when region = 'APAC'
                then total_days - individual_non_working_days - apac_holidays
            else total_days - individual_non_working_days - amer_holidays
        end as individual_schedulable_days
        
    from regions_joined
    
),

ordered as (
    
    select
    
        proserv_utilization_targets_id,  
        name,
        team,
        pod,
        resource_type,
        region, 
        rate,
        week_start, 
        target_utilization_percent, 
        total_days, 
        amer_holidays, 
        emea_holidays, 
        apac_holidays, 
        individual_non_working_days, 
        individual_schedulable_days
    
    from calculated
    
)

select * from ordered