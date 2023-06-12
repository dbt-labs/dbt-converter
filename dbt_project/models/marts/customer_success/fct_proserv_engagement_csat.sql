with

proserv_services_delivered as (
    
    select * from {{ ref('fct_services_delivery') }}
    where is_professional_services = true
    and is_opportunity_line_item_completed = true
    and salesforce_opportunity_line_item_id is not null
),

customer_csat as (

    select * from {{ ref('fct_complete_proserv_delighted_feedback') }}
    where created_at > '2023-02-01T00:00:00' --filter out old/test data

),

employee_csat as (

    select * from {{ ref('stg_googlesheets__proserv_staff_engagement_survey') }}
    where submitted_at > '2023-02-01T00:00:00' --filter out old/test data    

),    

proserv_engagement_summary as (

    select
        salesforce_opportunity_line_item_id,
        salesforce_account_id,
        customer_name,
        product_name,
        min(services_kicked_off_date) as services_kicked_off_date,
        min(start_date) as engagement_start_date,
        max(due_date) as max_due_date,
        max(number_of_project_team_members) as number_of_project_team_members,
        max(delivered_by_1_name) as delivered_by_1_name,
        max(delivered_by_2_name) as delivered_by_2_name,
        max(delivered_by_3_name) as delivered_by_3_name

    from proserv_services_delivered
    group by 1, 2, 3, 4

),

customer_csat_average as (

    select
        salesforce_opportunity_line_item_id,
        avg(score) as customer_csat_average,
        count(score) as total_customer_responses
    from customer_csat
    group by 1

),

employee_csat_average as (

    select 
        salesforce_opportunity_line_item_id,
        avg(ps_staff_consulting_csat) as employee_csat_average,
        count(ps_staff_consulting_csat) as total_employee_responses    
    from employee_csat
    group by 1

),

joined as (

    select 
        proserv_engagement_summary.salesforce_opportunity_line_item_id,
        proserv_engagement_summary.salesforce_account_id,
        proserv_engagement_summary.customer_name,
        proserv_engagement_summary.product_name,
        coalesce (
            (customer_csat_average.customer_csat_average +
                employee_csat_average.employee_csat_average) / 2,
            employee_csat_average.employee_csat_average,
            customer_csat_average.customer_csat_average
        ) as overall_csat,
        customer_csat_average.customer_csat_average,
        customer_csat_average.total_customer_responses,
        employee_csat_average.employee_csat_average,
        employee_csat_average.total_employee_responses,
        proserv_engagement_summary.number_of_project_team_members,
        proserv_engagement_summary.delivered_by_1_name,
        proserv_engagement_summary.delivered_by_2_name,
        proserv_engagement_summary.delivered_by_3_name,
        proserv_engagement_summary.services_kicked_off_date,
        proserv_engagement_summary.engagement_start_date,
        proserv_engagement_summary.max_due_date

    from proserv_engagement_summary
    left join customer_csat_average on
        proserv_engagement_summary.salesforce_opportunity_line_item_id =
        customer_csat_average.salesforce_opportunity_line_item_id
    left join employee_csat_average on
        proserv_engagement_summary.salesforce_opportunity_line_item_id =
        employee_csat_average.salesforce_opportunity_line_item_id

)

select * from joined