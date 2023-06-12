with 

utilization_targets as (

    select * from {{ ref('fct_services_utilization_targets') }}

),

utilization_periods as (

    select * from {{ ref('int__services_utilization_periods') }}

),

time_entries as (

    select * from {{ ref('fct_proserv_time_entries') }}

),

utilization_start_end as (
    --this cte gets the end of the week to make joining easier below
    select 
        name,
        week_start,
        lead(week_start) over(partition by name order by week_start) as next_week_start,
        dateadd('ns', -1, next_week_start) as week_end
from utilization_targets

),

time_entries_calculated as (
    --this ties the Harvest hours to the utilization target, 
    -- summarizing at the person + week + opportunity line item level
    select
        utilization_start_end.name,
        utilization_start_end.week_start,
        time_entries.salesforce_opportunity_line_item_id,
        sum(
            case
                when time_entries.is_billable then hours
                else null
            end 
            ) as billable_hours_delivered,
        sum(
            case
                when not time_entries.is_billable then hours
                else null
            end 
            ) as non_billable_hours_delivered
    from time_entries
        inner join utilization_start_end on 
            time_entries.user_full_name = utilization_start_end.name
            and time_entries.spent_at between utilization_start_end.week_start and utilization_start_end.week_end
    group by 1,2,3
),

utilization_joined as (

    select

        utilization_targets.*,
        utilization_periods.ps_weekly_hours_attributed,
        utilization_periods.delivered_revenue_attributed,
        utilization_periods.salesforce_opportunity_line_item_id,
        utilization_periods.project_line_item_name,
        time_entries_calculated.billable_hours_delivered,
        time_entries_calculated.non_billable_hours_delivered
    from utilization_targets
    left join utilization_periods
        on utilization_targets.week_start >= date_trunc(week,utilization_periods.start_week)
       and utilization_targets.week_start <= date_trunc(week,utilization_periods.due_week)
       and utilization_targets.name = utilization_periods.name
    left join time_entries_calculated
         on utilization_targets.name = time_entries_calculated.name
        and utilization_targets.week_start = time_entries_calculated.week_start
        and utilization_periods.salesforce_opportunity_line_item_id = time_entries_calculated.salesforce_opportunity_line_item_id

),

grouped as (

    select

        -- grouping at this level to allow for testing/joining to opp line items for delivery status
        {{  dbt_utils.generate_surrogate_key(
          [
            'name',
            'week_start',
            'salesforce_opportunity_line_item_id',
            'project_line_item_name'
          ]) }}
            as services_utilization_line_item_id,
        name,
        team,
        pod,
        resource_type,
        region,
        week_start,
        salesforce_opportunity_line_item_id,
        project_line_item_name,
        round(avg(rate),0) as rate,
        avg(target_utilization_percent) as target_utilization_percent,
        round(avg(total_days),0) as total_days,
        round(avg(individual_non_working_days),0) as individual_non_working_days,
        round(avg(individual_schedulable_days),0) as individual_schedulable_days,
        round(avg(amer_holidays),0) as amer_holidays,
        round(avg(emea_holidays),0) as emea_holidays,
        round(avg(apac_holidays),0) as apac_holidays,
        sum(ps_weekly_hours_attributed) as ps_hours_attributed,
        sum(delivered_revenue_attributed) as delivered_revenue_attributed,
        sum(billable_hours_delivered) as billable_hours_delivered,
        sum(non_billable_hours_delivered) as non_billable_hours_delivered
    from utilization_joined
    {{ dbt_utils.group_by(n=9) }}

)

select * from grouped
