with

harvest_projects as (
    
    select * from {{ ref('stg_harvest__projects') }}
),

harvest_clients as (
    
    select * from {{ ref('stg_harvest__clients') }}
    where
    not is_test_client
),

salesforce_opportunites as (
    
    select * from {{ ref('fct_opportunities_line_items') }}
    where
        is_won    
        and(is_professional_services or is_training)
),

salesforce_accounts as (

    select * from {{ ref('dim_salesforce_accounts') }}
),

harvest_combined as (

    select 
        harvest_clients.salesforce_account_id,
        harvest_projects.project_id,
        harvest_projects.salesforce_opportunity_line_item_id,
        harvest_clients.client_name as harvest_client_name,   
        harvest_projects.project_name as harvest_project_name,
        harvest_projects.budget as harvest_project_budget,
        harvest_projects.budget_by harvest_budget_by,
        harvest_projects.budget_is_monthly harvest_budget_is_monthly,
        harvest_projects.project_starts_on,
        harvest_projects.project_ends_on,
        harvest_projects.fee as harvest_fee,
        harvest_projects.hourly_rate as harvest_hourly_rate,
        harvest_projects.is_active,
        harvest_projects.is_billable,
        harvest_projects.is_fixed_fee    
    from harvest_projects
        join harvest_clients on
            harvest_projects.client_id = harvest_clients.client_id
),

add_salesforce_details as (
    
    select 
        harvest_combined.*,
        salesforce_opportunites.account_name as salesforce_account_name,
        salesforce_opportunites.product_name as salesforce_product_name,
        salesforce_opportunites.product_code,
        salesforce_opportunites.quantity as salesforce_quantity,
        salesforce_opportunites.total_price as salesforce_total_price,
        salesforce_opportunites.unit_price as salesforce_unit_price,
        salesforce_accounts.account_region,
        salesforce_accounts.market_segment,
        salesforce_accounts.industry,
        salesforce_opportunites.is_professional_services,
        salesforce_opportunites.is_training
    from harvest_combined
        left join salesforce_opportunites on
            harvest_combined.salesforce_opportunity_line_item_id = salesforce_opportunites.opportunity_line_item_id
        left join salesforce_accounts on
            harvest_combined.salesforce_account_id = salesforce_accounts.account_id
)
--combine the data giving precedence to Salesforce
select
    salesforce_account_id,
    coalesce(salesforce_account_name, harvest_client_name) as client_name,
    account_region,
    market_segment,
    industry,
    project_id,
    salesforce_opportunity_line_item_id,
    coalesce(salesforce_product_name, harvest_project_name) as project_name,
    coalesce(salesforce_quantity, harvest_project_budget) as project_quantity,
    coalesce(salesforce_total_price, harvest_fee) as project_total_price,
    coalesce(
        case
            when product_code = 'service_hour' then salesforce_unit_price
            else null
        end, 
        harvest_hourly_rate
    ) as hourly_rate,
    project_starts_on,
    project_ends_on,
    is_active,
    is_billable,
    is_fixed_fee,
    is_professional_services,
    is_training
from add_salesforce_details
