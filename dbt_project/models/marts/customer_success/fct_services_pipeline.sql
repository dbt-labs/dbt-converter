with 

line_items as (

    select * from {{ ref('fct_opportunities_line_items') }}
    where (is_professional_services or is_training)
      and product_name != 'Rapid Onboarding Implementation' -- this is a $0 bundle that is exploded into 2 separate skus

),

time_entries as (

    select
        salesforce_opportunity_line_item_id,
        sum(
            case
                when is_billable then hours
                else null
            end 
        ) as billable_hours_delivered,
        sum(
            case
                when not is_billable then hours
                else null
            end 
        ) as non_billable_hours_delivered
    from {{ ref('fct_proserv_time_entries') }}
    group by 1
),

line_items_with_hours as (

    select

        *,
        case
            when product_name = 'dbt Learn, Rapid Onboarding'
                then 12 * quantity
            -- accounts for changes in FY2023 price book
            -- previously sold as chunks of variable hours (only ever sold 8, 10, and 12)
            -- standardized to quantity of 1 = 12 hours
            when product_name = 'dbt Office Hours' and quantity in (8,10,12) 
                then quantity
            when product_name = 'dbt Office Hours' 
                then 12 * quantity  
            when product_name = 'Rapid Onboarding Implementation'
                then 12 * quantity
            when product_name = 'dbt Learn, Group Training'
                then 28 * quantity
            when product_name = 'dbt Learn, Group Training S'
                then 14 * quantity
            when product_name = 'dbt Learn, Rapid Onboarding - Lite'
                then 2 * quantity
            when product_name = 'dbt Learn, Deploy'
                then 8 * quantity
            when product_name = 'dbt Configure'
                then 10 * quantity
            when product_name = 'dbt PS Pro Setup'
                then 5 * quantity
            when product_name = 'dbt Audit'
                then 20 * quantity
            else quantity
        end as hours_sold

    from line_items

),

ordered as (

    select

        {{  dbt_utils.generate_surrogate_key([
            'opportunity_id',
            'opportunity_line_item_id'
        ]) }} as unique_id,

        opportunity_id,
        opportunity_line_item_id,
        product_id,
        account_id,

        account_name,
        forecast_category_name,
        probability,
        stage_name,
        product_code,
        product_name,
        product_type,
        opportunity_type,
        region,
        has_technical_win,

        unit,
        quantity as quantity_sold,
        hours_sold,

        is_professional_services,
        is_training,
        is_won as is_opp_closed_won,

        opportunity_amount,
        list_price,
        total_price,
        unit_price,
        rate,

        -- consumption
        quantity_used,
        quantity_scheduled,
        usage_status,

        close_at,
        service_date,
        starts_on,
        ends_on,
        last_modified_at,
        created_at

    from line_items_with_hours

),

add_time_tracking as (

    select 
        ordered.*,
        time_entries.billable_hours_delivered,
        time_entries.non_billable_hours_delivered,
        (
            coalesce(time_entries.billable_hours_delivered,0)  
            + coalesce(time_entries.non_billable_hours_delivered,0)
        ) as total_hours_delivered
    from ordered
        left join time_entries on
            ordered.opportunity_line_item_id = time_entries.salesforce_opportunity_line_item_id
)

select * from add_time_tracking
