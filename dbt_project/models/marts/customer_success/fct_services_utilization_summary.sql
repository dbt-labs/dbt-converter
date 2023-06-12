with 

utilization as (
    
    select * from {{ ref('fct_services_utilization_line_items') }}
    
),

regrouped as (
    
    select
    
        -- REgrouping at this level to keep the grain at one row per name/week
        {{  dbt_utils.generate_surrogate_key([
            'name',
            'week_start'
        ]) }} as services_utilization_id,
        name, 
        team,
        pod,
        resource_type,
        region, 
        week_start, 
        round(avg(rate),0) as rate, 
        avg(target_utilization_percent) as target_utilization_percent, 
        round(avg(total_days),0) as total_days, 
        round(avg(individual_non_working_days),0) as individual_non_working_days,
        round(avg(individual_schedulable_days),0) as individual_schedulable_days,
        round(avg(amer_holidays),0) as amer_holidays, 
        round(avg(emea_holidays),0) as emea_holidays, 
        round(avg(apac_holidays),0) as apac_holidays, 
        sum(ps_hours_attributed) as ps_hours_attributed,
        round(sum(delivered_revenue_attributed),0) as delivered_revenue_attributed,
        sum(billable_hours_delivered) as billable_hours_delivered,
        sum(non_billable_hours_delivered) as non_billable_hours_delivered
    
    from utilization
    {{ dbt_utils.group_by(n=7) }}
    
)

select * from regrouped