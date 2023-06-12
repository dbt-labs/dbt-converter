

with

opps as (

    select * from {{ ref('fct_opportunities') }}

),

transformed as (

    select 
        owner_name,
        account_name,
        account_id,
        opportunity_id,
        opportunity_name,
        stage_name,

        case
            when close_date <= '2021-01-31'
                 then '2021-01-31'
            else close_date
        end as close_date,

        contract_start_date,
        created_date,
        opportunity_type,
        delta_arr,
        delta_customer,
        expected_arr_delta,
        expected_delta_customer,
        cycle_time_days_since_discover,
        lead_source_type,
        source_lead,
        opener_name,
        opener_role,
        starting_arr,
        end_arr,
        delta_arr_direction,
        'Managed' as sales_channel,
        gross_arr,
        churn_arr
    
    from opps
    where date_trunc('month',close_date) <= dateadd('month',-1,date_trunc('month',current_date))
    
)

select * from transformed