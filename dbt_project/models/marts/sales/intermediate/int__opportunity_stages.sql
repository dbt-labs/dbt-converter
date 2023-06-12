with history as (

    select * from {{ ref('stg_salesforce__opportunity_history') }}
    where is_deleted = false

),

stages as (

    select * from {{ ref('stg_salesforce__opportunity_stages') }}
    where is_active = true

),

opps_stages_joined as (

    select

        history.opportunity_id,
        history.stage_name,
        stages.sort_order as stage_sort_order,
        history.amount,
        history.expected_revenue,
        
        history.close_date,
        history.created_at,
        history.created_date
    
    from history
    left join stages using (stage_name)

),

normalized as (
    
    select
    
        opportunity_id, 
        stage_name,
        stage_sort_order, 
        amount, 
        expected_revenue,
        close_date,
        created_at,

        case 
            when stage_name in ('Closed Won', 'Closed Lost')
            and close_date <= current_date
                then close_date 
            else created_date 
        end as created_date
                -- accounting for opportunities that are moved to Closed AFTER their actual close date

    from opps_stages_joined
    
),

windowed as (
    
    --get final changes at the day level
    
    select distinct
    
        opportunity_id, 
        created_date,
        
        {% set field_names = [
        "stage_name",
        "stage_sort_order", 
        "amount", 
        "expected_revenue",
        "close_date"
        ]%}
        
        {% for field_name in field_names -%}
                  
        last_value({{field_name}}) over (
            partition by opportunity_id, created_date
                order by created_at rows between unbounded preceding
            and unbounded following) as {{field_name}} 
            
             {{ "," if not loop.last }}
             
        {%- endfor -%}
         
        from normalized

),

with_status_change as (
    
    select 
    
        *,
        
        lead(created_date) over (
            partition by opportunity_id order by created_date) 
        as status_change_date, -- date at which next change happened 
        
        case 
            when lead(stage_name) over (
                partition by opportunity_id order by created_date) != stage_name
            then lead(created_date) over (
               partition by opportunity_id order by created_date)
           else null
        end as stage_change_date -- when did the opportunity enter the next stage
            
    from windowed

),

-- The below logic finds the furthest stage achieved for each opp excluding closed stages
furthest_non_closed_stage_achieved as (

    select distinct

        opportunity_id,

        last_value(stage_name) over (
            partition by opportunity_id
            order by stage_sort_order, created_date)
        as furthest_non_closed_stage_name,

        last_value(stage_sort_order) over (
            partition by opportunity_id
            order by stage_sort_order, created_date)
        as furthest_non_closed_stage_sort_order
    
    from windowed
    where not stage_name ilike '%closed%'

),

filled as (
    
    select 
    
        {{ dbt_utils.generate_surrogate_key([
            'opportunity_id',
            'created_date'
        ]) }} as unique_id,

        with_status_change.*,

        furthest_non_closed_stage_achieved.furthest_non_closed_stage_name as furthest_non_closed_stage_achieved,
        furthest_non_closed_stage_achieved.furthest_non_closed_stage_sort_order as furthest_non_closed_stage_sort_order_achieved,

        coalesce(stage_change_date, 
            lead(stage_change_date) ignore nulls over (
                partition by opportunity_id, stage_name 
                    order by created_date)) 
        as next_stage_date -- fill in dates for opportunities that don't change stages,
                                -- but instead have an update to some other field            
    from with_status_change
    left join furthest_non_closed_stage_achieved using (opportunity_id)

)

select * from filled
