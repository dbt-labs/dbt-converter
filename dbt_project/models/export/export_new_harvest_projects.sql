with

harvest_clients as (

    select * from {{ ref('stg_harvest__clients') }}
    where is_active

),

harvest_projects as (

    select * from {{ ref('stg_harvest__projects') }}

),

services_scheduled as (

    select * from {{ ref('fct_services_delivery') }}
    -- Migrating to process for FY2024 Q1 and forward
    where start_date >= '2023-03-16'
        and customer_name is not null
        and is_project_line_item_completed = false
        -- Temp fix: no associated Salesforce opportunity line item for internal projects
        and project_category != 'Internal Project'

),

-- Some projects will return multiple rows in services_delivery CTE with different hour and / or date values
-- ex: salesforce_opportunity_line_item_id = '00k4v000017mPv7AAE'
distinct_projects as (

    select
        salesforce_opportunity_line_item_id,
        salesforce_account_id,

        concat(project_line_item_name,' - ', product_name) as project_name,
        is_hour_budget_monthly,

        sum(ps_monthly_hours) as budget,
        min(start_date::date)::string as starts_on,
        max(due_date)::string as ends_on

    from services_scheduled
    group by 1, 2, 3, 4

),

projects_with_client_id as (

    select
        distinct_projects.salesforce_opportunity_line_item_id,
        harvest_clients.client_id,

        distinct_projects.project_name,
        distinct_projects.budget,

        'Project' as bill_by,
        'project' as budget_by,
        
        false as budget_is_monthly,

        true as show_budget_to_all,
        true as is_billable,

        distinct_projects.starts_on,
        distinct_projects.ends_on
        
    from distinct_projects
    left join harvest_clients
        on distinct_projects.salesforce_account_id = harvest_clients.salesforce_account_id
    -- Exclude projects before client is created with export_new_harvest_clients
    where client_id is not null

),

-- Select all to-be-delivered projects that do not exist Harvest
final as (

    select
    
        {{dbt_utils.generate_surrogate_key(['projects_with_client_id.salesforce_opportunity_line_item_id','projects_with_client_id.project_name'])}} as unique_id,
        projects_with_client_id.*
    
    from projects_with_client_id
    left join harvest_projects
        on projects_with_client_id.salesforce_opportunity_line_item_id = harvest_projects.salesforce_opportunity_line_item_id
       and projects_with_client_id.project_name = harvest_projects.project_name
    where harvest_projects.salesforce_opportunity_line_item_id is null

)

select * from final