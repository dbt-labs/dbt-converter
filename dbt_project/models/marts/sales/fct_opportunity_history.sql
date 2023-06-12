with days as (

    select * from {{ ref('all_days') }}
    where date_day <= current_date

),

opp_hist as (

    select * from {{ ref('int__opportunity_stages') }}
),

aggregated as (
    
    select
    
        opportunity_id,
        
        min(created_date) as opportunity_start_date,
                
        coalesce(max(case when stage_name in ('Closed Won','Closed Lost') then close_date
        else null end), current_date ) as opportunity_end_date
        
            -- In the case that the opportunity has closed, we want the close_date to be the 
            -- opportunity end date. If it hasn't, we'd want to spine to the current_date. 
        
    from opp_hist
    group by 1 

    
),

spine as (
    
    select
    
        {{dbt_utils.generate_surrogate_key(['days.date_day', 'aggregated.opportunity_id'])}} as id,
        aggregated.opportunity_id,
        aggregated.opportunity_start_date, 
        aggregated.opportunity_end_date,
        days.date_day
        
    from aggregated
    cross join days 
    where days.date_day >= aggregated.opportunity_start_date
        and days.date_day <= aggregated.opportunity_end_date -- define beginning and end dates for the spine
),


joined as (
    
    select
        spine.id,
        spine.date_day,
        spine.opportunity_start_date, 
        spine.opportunity_end_date,
        
        opp_hist.opportunity_id,
        opp_hist.stage_name,
        opp_hist.amount,
        opp_hist.expected_revenue,
        opp_hist.created_date,
        opp_hist.close_date,
        opp_hist.next_stage_date,
        opp_hist.status_change_date
        
    from spine
    left join opp_hist
        on spine.opportunity_id = opp_hist.opportunity_id  
        and spine.date_day >= opp_hist.created_date
        and spine.date_day < coalesce(opp_hist.status_change_date, opp_hist.next_stage_date, current_date)

)


select * from joined