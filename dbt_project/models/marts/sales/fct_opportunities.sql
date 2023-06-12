with

opps as (
    
    select * from {{ ref('stg_salesforce__opportunities') }}
    
),

opps_line_items as (
    
    select * from {{ ref('stg_salesforce__opportunity_line_items') }}
    
),

accounts as (
    
    select * from {{ ref('stg_salesforce__accounts') }}

),

owners as (
    
    select * from {{ ref('stg_salesforce__owners') }}
    
),

stages as (

    select * from {{ ref('stg_salesforce__opportunity_stages') }}

),

gong_calls as (

    select * from {{ ref('stg_salesforce__gong_calls') }} 

),

opp_history as (

    select * from {{ ref('int__opportunity_stages') }}

),

partners as (

    select * from {{ ref('stg_salesforce__partners') }}

),

touchpoints as (

    select * from {{ ref('stg_salesforce__touchpoints') }}
    where is_deleted = false

),

quotes as (

    select * from {{ ref('stg_salesforce__quotes') }}
    where is_deleted = false
),

orders as (

    select * from {{ ref('stg_salesforce__orders') }}
    where is_deleted = false
),

channel_mappings as (

    select * from {{ ref('fct_notion_channel_mapping') }}
    where event_name is not null
        and source_type is not null

),

cloud_account_mappings as (

    select * from {{ ref('cloud_account_mappings') }}

),

unique_channels as (

    select distinct
        event_name,
        source_type
    
    from channel_mappings

),

rapid_onboarding_exceptions as (

    select
        opportunity_id,
        onboarding_discount_removal_reason,
        onboarding_discount_removal_details
    from quotes
    where 
        opportunity_id is not null
        and is_primary = true
        and is_ordered = true

),

furthest_non_closed_stage_achieved as (

    select distinct
        opportunity_id,
        furthest_non_closed_stage_achieved,
        furthest_non_closed_stage_sort_order_achieved
    
    from opp_history

),

line_items_aggregated as (
    
    select 
        opportunity_id, 
        max(is_on_prem) as is_on_prem,
        max(is_service_hour) as has_service_hours
        
    from opps_line_items
    group by 1 
        
),

orders_aggregated as (

    select
        sfdc_opportunity_id as opportunity_id,
        count(*) as count_of_orders_created,
        count_of_orders_created > 0 as has_orders

    from orders
    where opportunity_id is not null
    group by 1

),

cloud_accounts_aggregated as (

    select
        account_id as cloud_account_id,
        stripe_customer_id,
        salesforce_account_id,
        billing_account_id,
        customer_id,
        customer_name,
        customer_id_type,
        is_primary_cloud_account,
        count(cloud_account_id) over (
            partition by salesforce_account_id
        ) as total_cloud_accounts,
        count(case when is_account_deleted = false then cloud_account_id end) over (
            partition by salesforce_account_id
        ) as total_active_cloud_accounts

    from cloud_account_mappings

),

joined as (
    
    select 
        ---------- account level information
        accounts.account_name,
        partners.partner_name,
        accounts.account_source,
        accounts.account_type,
        accounts.market_segment,
        accounts.dei_research_notes,
        
        ---------- flag based on products purchased 
        line_items_aggregated.is_on_prem,
        line_items_aggregated.has_service_hours,
        
        ---------- dbt cloud account information
        cloud_accounts_aggregated.cloud_account_id as primary_cloud_account_id,
        cloud_accounts_aggregated.stripe_customer_id,
        cloud_accounts_aggregated.total_cloud_accounts,
        cloud_accounts_aggregated.total_active_cloud_accounts,

        coalesce(
            cloud_accounts_aggregated.customer_id,
            accounts.account_id
        ) as customer_id,
        coalesce(
            cloud_accounts_aggregated.customer_name,
            accounts.account_name
        ) as customer_name,
        coalesce(
            cloud_accounts_aggregated.customer_id_type,
            'salesforce_account_id - missing from cloud_account_mappings'
        ) as customer_id_type,
        coalesce(
            cloud_accounts_aggregated.billing_account_id,
            {{ dbt_utils.generate_surrogate_key([
                'coalesce(cloud_accounts_aggregated.customer_id,accounts.account_id)',
                'cloud_accounts_aggregated.cloud_account_id'
            ]) }} 
        ) as billing_account_id,
            --A billing account is a discrete method by which a customer is
            --paying for a cloud account. This facilitates aggregation to the 
            --customer, organization, and persons grains
            -- See more: https://www.notion.so/dbtlabs/Billing-Accounts-b0c33a62f6ed4638aeaf2baeed982282

        ---------- opportunity owner information
        owners.owner_name,
        opportunity_openers.owner_name as opener_name,
        tech_owners.owner_name as technical_lead,
        partner_managers.owner_name as partner_manager_name,
        
        ---------- stage name information
        stages.sort_order as stage_sort_order,
        
        ---------- opportunity information
        
        row_number() over (
            partition by opps.account_id
            order by opps.created_at
        ) as opportunity_index,

        furthest_non_closed_stage_achieved.furthest_non_closed_stage_achieved,
        furthest_non_closed_stage_achieved.furthest_non_closed_stage_sort_order_achieved,
        
        case
            when opps.discover_at is not null and opps.opportunity_type = 'Land' then 'Pipeline'
            when opps.discover_at is null and opps.opportunity_type = 'Land' then 'Pre-Pipeline'
        end as furthest_pipeline_stage_achieved,

        nurtured_opportunity_id is not null as is_from_nurtured_opportunity,

        rapid_onboarding_exceptions.onboarding_discount_removal_reason,
        rapid_onboarding_exceptions.onboarding_discount_removal_details,

        ---------- ARR Classifications
        case
            when delta_arr > 0
                then 'Increase'
            when delta_arr < 0
                then 'Decrease'
            else 'No Change'
        end as delta_arr_direction,

        case
            when opps.stage_name = 'Closed Won'
            and delta_arr > 0
                then delta_arr
            else null
        end as gross_arr,

        case
            when opps.stage_name = 'Closed Lost'
            and opps.opportunity_type = 'Renew'
                then delta_arr
            when opps.stage_name = 'Closed Lost'
            and opps.opportunity_type = 'Expand'
            and delta_arr < 0
                then delta_arr
            when opps.stage_name = 'Closed Won'
            and opps.opportunity_type in ('Renew','Expand')
            and delta_arr < 0
                then delta_arr
            else null
        end as churn_arr,

        ---------- customer movement classifications
        case
            when
                opps.opportunity_type = 'Land'
                and opps.stage_name = 'Closed Won'
                then true
            else false
        end as is_customer_movement_land,
        case
            when
                opps.opportunity_type = 'Renew'
                and opps.stage_name = 'Closed Lost'
                then true
            else false
        end as is_customer_movement_churn,
        case
            when
                opps.opportunity_type in ('Renew','Expand')
                and (opps.stage_name = 'Closed Won'
                and opps.expected_arr_delta > 0)
                then true
            else false
        end as is_customer_movement_expand,
        case
            when
                opps.opportunity_type = 'Renew'
                and opps.stage_name ='Closed Won'
                and opps.expected_arr_delta < 0 
                then true
            else false
        end as is_customer_movement_downsell,
        case
            when
                opps.opportunity_type in ('Renew','Expand')
                and (opps.stage_name = 'Closed Won'
                and opps.expected_arr_delta = 0)
                then true
            else false
        end as is_customer_movement_renew,
        case
            when
                opps.opportunity_type = 'Renew'
                and opps.is_closed = false
                and opps.probability = 0
                then true
            else false
        end as is_customer_movement_expected_churn,
        case
            when
                opps.opportunity_type = 'Renew'
                and opps.is_closed = false
                and opps.probability > 0
                and coalesce(opps.expected_arr_delta,0) < 0 
                then true
            else false
        end as is_customer_movement_expected_downsell,
        case
            when
                opps.opportunity_type = 'Renew'
                and opps.is_closed = false
                and opps.probability > 0 
                and opps.expected_arr_delta >= 0
                then true
            else false
        end as is_customer_movement_up_for_renewal,
        case
            when
                opps.opportunity_type = 'Expand'
                and opps.is_closed = false
                and opps.probability > 0 
                and opps.expected_arr_delta >= 0
                then true
            else false
        end as is_customer_movement_up_for_expansion,
        case
            when
                opps.opportunity_type = 'Land'
                and opps.is_closed = false
                and opps.probability > 0 
                then true
            else false
        end as is_customer_movement_open_pipeline,

        ---------- touchpoint information
        touchpoints.touchpoint_source,
        touchpoints.touchpoint_source_type,
        touchpoints.touchpoint_source_detail,

        ---------- channel mappings
        unique_channels.source_type,

        opps.*,

        coalesce(has_orders, false) as has_orders,
        coalesce(count_of_orders_created, 0) as count_of_orders_created
    
    from opps
    left join accounts
        on opps.account_id = accounts.account_id
    left join partners
        on opps.partner_id = partners.partner_id
    left join line_items_aggregated
        on opps.opportunity_id = line_items_aggregated.opportunity_id
    left join stages
        on opps.stage_name = stages.stage_name
    left join furthest_non_closed_stage_achieved
        on opps.opportunity_id = furthest_non_closed_stage_achieved.opportunity_id
    left join owners
        on opps.owner_id = owners.owner_id
    left join touchpoints
        on opps.touchpoint_id = touchpoints.touchpoint_id
    left join owners as tech_owners
        on opps.technical_lead_id = tech_owners.owner_id
    left join owners as opportunity_openers
        on opps.opener_id = opportunity_openers.owner_id
    left join owners as partner_managers
        on opps.partner_manager_id = partner_managers.owner_id
    left join rapid_onboarding_exceptions
        on opps.opportunity_id = rapid_onboarding_exceptions.opportunity_id
    left join unique_channels
        on opps.lead_source_from_lead = unique_channels.event_name
    left join orders_aggregated
        on opps.opportunity_id = orders_aggregated.opportunity_id
    left join cloud_accounts_aggregated
        on opps.account_id = cloud_accounts_aggregated.salesforce_account_id
        and cloud_accounts_aggregated.is_primary_cloud_account = True

)

select * from joined