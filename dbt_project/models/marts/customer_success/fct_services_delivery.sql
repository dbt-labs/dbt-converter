with 

-- filtering trello to only data from may 2021 back and asana from june 2021 forward.
-- this is when the pro-serv team started entering projects into asana.
legacy_trello_projects as (

    select * from {{ ref('int__historical_trello_sprints') }}
    where name ilike '%sprint%'
    and client not ilike '%template%'
    and date_trunc('month', end_date) <= '2021-05-01'

),

asana_tasks as (

    select * from {{ ref('fct_asana_project_tasks') }}
    where project_id = '1200356789060256'  -- Triage Services Board (https://app.asana.com/0/1200356789060256)
        and current_section_name != 'Untitled section'  -- Test projects and templates sometimes land under this section
        and task_name not ilike 'James''s Test Account%' -- Test tasks from Salesforce test account (https://fishtown.lightning.force.com/lightning/r/Account/0014v00002Id1ZEAAZ/view)

),

line_items as (

    select * from {{ ref('fct_opportunities_line_items') }}
    where (is_professional_services or is_training)
      and product_name != 'Rapid Onboarding Implementation' -- this is a $0 bundle that is exploded into 2 separate skus

),

legacy_trello_projects_renamed as (

    select
        null as project_id,
        null as task_id,
        null as team_id,
        null as owner_id,
        null as salesforce_account_id,
        null as salesforce_opportunity_id,
        null as salesforce_opportunity_line_item_id,
        null as salesforce_product_id,
        null as delivered_by_1_id,
        null as delivered_by_2_id,
        null as delivered_by_3_id,
        false as is_partner_delivered,
        true as is_professional_services,
        false as is_training,
        client as customer_name,
        'legacy_trello_client_name' as customer_name_type,
        'Service Hour' as product_name,
        'Professional Services' as project_category,
        null as quantity_sold,
        null as unit,
        false as is_service_deferred,
        concat(customer_name,' - Service Hour') as project_name,
        case
            when label = 'Enterprise'
                then 'Enterprise'
            else 'Inbound'
        end as project_source,
        owner_name as delivered_by_1_name,
        null as delivered_by_2_name,
        null as delivered_by_3_name,
        null as project_owner_email,
        name as project_line_item_name,
        cost,
        is_completed as is_project_line_item_completed,
        is_completed as is_opportunity_line_item_completed,
        end_date as due_date,
        start_date,
        null as services_kicked_off_date,
        null as services_delivered_date,
        null as opportunity_term_end,
        null as proserve_scheduling_notes,
        null as current_section_name,
        null as ps_monthly_hours,
        null as is_hour_budget_monthly

    from legacy_trello_projects

),

asana_tasks_renamed as (

    select
        project_id,
        task_id,
        team_id,
        owner_id,
        case
            when proserve_engagement_type = 'Internal Project'
                then '0014v00002OxoX7AAJ'
            else salesforce_account_id
        end as salesforce_account_id,
        salesforce_opportunity_line_item_id,
        delivered_by_1_id,
        delivered_by_2_id,
        delivered_by_3_id,

        case
            when proserve_engagement_type ilike '%partner%'
                then true
            else false
        end as is_partner_delivered,

        case
            when proserve_engagement_type ilike '%hourly%pro%'
                then 'Inbound'
            else 'Enterprise'
        end as project_source,

        delivered_by_1_name,
        delivered_by_2_name,
        delivered_by_3_name,
        project_owner_email,
        case
            when proserve_engagement_type != 'Internal Project'
                then task_name
            -- Prevents unique id collision when proserve_engagement_type is not populated
            when proserve_engagement_type is null
                then task_name
            else null
        end as project_line_item_name,

        case
            when proserve_engagement_type = 'Internal Project'
                then 297.50 * ps_monthly_hours
        end as cost,

        is_task_completed as is_project_line_item_completed,
        due_on as due_date,
        case
          when start_on is null
            then dateadd(day, -30, due_date)
          else start_on
        end as start_date,
        proserve_scheduling_notes,
        current_section_name,
        ps_monthly_hours,
        proserve_engagement_type,
        task_name

    from asana_tasks

),

-- One row per salesforce_opportunity_line_item_id X quantity
products_joined as (

    select
        project_id,
        task_id,
        team_id,
        owner_id,
        salesforce_account_id,
        opportunity_id as salesforce_opportunity_id,
        salesforce_opportunity_line_item_id,
        product_id as salesforce_product_id,
        delivered_by_1_id,
        delivered_by_2_id,
        delivered_by_3_id,
        is_partner_delivered,
        is_professional_services,
        is_training,
        case
            when proserve_engagement_type = 'Internal Project'
                then 'dbt Labs'
            else line_items.account_name
        end as customer_name,
        'salesforce_account_name' as customer_name_type,
        case
            when proserve_engagement_type = 'Internal Project'
                then 'Internal Project'
            else line_items.product_name
        end as product_name,
        -- same logic used in stg_salesforce__opportunity_line_items; included to
        -- be able to include 'Internal Projects'
        case
            when proserve_engagement_type = 'Internal Project'
                then 'Internal Project'
            when is_professional_services = 1 then 'Professional Services'
            when is_training = 1
              then 'Training'
            else null
        end as project_category,
        -- There is 1 Asana task for each quantity sold when unit != 'Hour'
        -- Associated test: accepted_values_fct_opportunities_line_items_unit__Hou
        case
            when line_items.unit = 'Hour'  -- Quantity remains accurate
                then line_items.quantity
            else 1  -- Quantity becomes inaccurate due to fanout
        end as quantity_sold,
        line_items.unit as unit,

        case
            when line_items.quantity_deferred > 0
                then true
            else false
        end as is_service_deferred,

        case
            when proserve_engagement_type = 'Internal Project'
                then task_name
            else concat(customer_name,' - ',coalesce(line_items.product_name,''))
        end as project_name,
        project_source,
        delivered_by_1_name,
        delivered_by_2_name,
        delivered_by_3_name,
        project_owner_email,
        case
            when proserve_engagement_type = 'Internal Project'
                then task_name
            else project_line_item_name
        end as project_line_item_name,
        cost,
        is_project_line_item_completed,
        booland_agg(is_project_line_item_completed) over (
            partition by salesforce_opportunity_line_item_id
        ) as is_opportunity_line_item_completed,

        due_date,
        start_date,
        line_items.services_kicked_off_date,
        line_items.services_delivered_date,
        line_items.opportunity_term_end,
        proserve_scheduling_notes,
        current_section_name,
        -- This works due to the X quantity fanout when joining
        -- based off of logic in fct_services_pipeline for consistency
        case
            when product_name = 'dbt Learn, Rapid Onboarding'
                then 12
            -- accounts for changes in FY2023 price book
            -- previously sold as chunks of variable hours (only ever sold 8, 10, and 12)
            -- standardized to quantity of 1 = 12 hours
            when product_name = 'dbt Office Hours' and quantity in (8,10,12) 
                then quantity
            when product_name = 'dbt Office Hours' 
                then 12  
            when product_name = 'Rapid Onboarding Implementation'
                then 12
            when product_name = 'dbt Learn, Group Training'
                then 28
            when product_name = 'dbt Learn, Group Training S'
                then 14
            when product_name = 'dbt Learn, Rapid Onboarding - Lite'
                then 2
            when product_name = 'dbt Learn, Deploy'
                then 8
            when product_name = 'dbt Configure'
                then 10
            when product_name = 'dbt PS Pro Setup'
                then 5
            when product_name = 'dbt Audit'
                then 20
            else ps_monthly_hours
        end as ps_monthly_hours,
        case
            when line_items.product_name in (
                'dbt Learn, Rapid Onboarding',
                'dbt Learn, Group Training',
                'dbt Learn, Rapid Onboarding - Lite',
                'dbt Configure',
                'dbt Office Hours'
            )
                then false
            else true
        end as is_hour_budget_monthly

    from asana_tasks_renamed
    left join line_items
        on asana_tasks_renamed.salesforce_opportunity_line_item_id = line_items.opportunity_line_item_id

),

unioned as (

    select * from legacy_trello_projects_renamed
    union all
    select * from products_joined

),

with_attribution as (

    select
        {{  dbt_utils.generate_surrogate_key([
            'salesforce_opportunity_line_item_id',
            'project_name',
            'project_line_item_name',
            'due_date '
        ]) }} as unique_id,

        project_id as asana_project_id,
        task_id as asana_task_id,
        team_id,
        owner_id,
        salesforce_account_id,
        salesforce_opportunity_id,
        salesforce_opportunity_line_item_id,
        salesforce_product_id,
        delivered_by_1_id,
        delivered_by_2_id,
        delivered_by_3_id,
        is_partner_delivered,
        is_professional_services,
        is_training,

        array_construct_compact(
            delivered_by_1_name,
            delivered_by_2_name,
            delivered_by_3_name
        ) as project_team_list,

        array_size(project_team_list) as number_of_project_team_members,

        md5(customer_name)::varchar(100) as customer_id,
        concat(customer_name_type,'_md5_encoded') as customer_id_type,
        customer_name,

        current_section_name as current_scheduling_section_name,
        project_source,
        project_name,
        product_name,
        project_category,
        delivered_by_1_name,
        delivered_by_2_name,
        delivered_by_3_name,
        case
            when number_of_project_team_members > 0
                then round((100/number_of_project_team_members)/100,5)
            else 0
        end as attribution_per_team_member,

        project_owner_email,
        project_line_item_name,
        cost,
        is_project_line_item_completed,
        is_opportunity_line_item_completed,
        due_date,
        start_date,
        services_kicked_off_date,
        services_delivered_date,
        -- This is not reliable for 100% of accounts yet. The services coordinator is looking for the
        -- best way to provide the data for appx 20 accounts that were granted a verbal contract extension.
        case
            when is_service_deferred = true or current_section_name = 'Deferred'
                then opportunity_term_end
            when is_project_line_item_completed = true
                then due_date
            else null
        end as services_revenue_recognition_date,
        proserve_scheduling_notes,
        date_trunc('week', start_date) as start_week,
        date_trunc('week', due_date) as due_week,
        datediff('week', start_week, due_week) + 1 as project_weeks,
        ps_monthly_hours,
        ps_monthly_hours / project_weeks as ps_weekly_hours,
        is_hour_budget_monthly,
        case
            when unit = 'Hour' and ps_monthly_hours is not null
                then ps_monthly_hours / quantity_sold
            else 1
        end as opp_line_item_delivery_percentage

    from unioned

)

select * from with_attribution
