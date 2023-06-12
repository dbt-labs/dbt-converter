{% set delivered_by = dbt_utils.get_column_values
    (
        table=ref('int__services_delivered_by'), 
        column='name'
    ) 
%}

with

delivery as (
    
    select * from {{ ref('fct_services_delivery') }}
    
),

pipeline as (
    
    select * from {{ ref('fct_services_pipeline') }}
    
),

delivered_by as (
    
    select distinct name, team from {{ ref('stg_googlesheets__proserv_utilization_targets') }}
    
),

pipeline_joined as (
    
    select 
    
        delivery.*,
        pipeline.unit,
        pipeline.quantity_sold,
        pipeline.list_price,
        pipeline.total_price,
        pipeline.unit_price,
        pipeline.rate,
        pipeline.quantity_used,
        pipeline.quantity_scheduled,
        pipeline.usage_status
        
    from delivery
    full join pipeline
        on delivery.salesforce_opportunity_line_item_id = pipeline.opportunity_line_item_id
       and delivery.salesforce_account_id = pipeline.account_id
    
),

calculated as (

{% for deliverer in delivered_by %}
    
    select

        '{{ deliverer }}' as name,
        salesforce_opportunity_line_item_id,
        project_line_item_name,
        date_trunc(week,start_date) as start_week,
        date_trunc(week,due_date) as due_week,
        sum(ps_weekly_hours * attribution_per_team_member) as ps_weekly_hours_attributed,
        sum(      
            case
                when project_category = 'Internal Project' 
                    then ps_weekly_hours * attribution_per_team_member * 350
                when unit = 'Hour'
                    then unit_price * ps_weekly_hours * attribution_per_team_member
                else (unit_price * attribution_per_team_member)/project_weeks
            end) as delivered_revenue_attributed
        
    from pipeline_joined
    where (
        delivered_by_1_name ilike name 
     or delivered_by_2_name ilike name 
     or delivered_by_3_name ilike name
        )
    group by 1,2,3,4,5

{% if not loop.last %} union all {% endif %}

{% endfor %}

), 

team_joined as (
    
    select
    
        calculated.*,
        delivered_by.team
        
    from calculated
    left join delivered_by
        on calculated.name = delivered_by.name
    
),

with_id as (
    
    select
    
        {{  dbt_utils.generate_surrogate_key([
            'name',
            'salesforce_opportunity_line_item_id',
            'start_week',
            'delivered_revenue_attributed',
            'project_line_item_name']) }} 
            as unique_id,
        *
        
    from team_joined
    
)

select * from with_id
where ps_weekly_hours_attributed is not null