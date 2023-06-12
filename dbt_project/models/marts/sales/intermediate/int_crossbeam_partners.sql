with
-- Salesforce Information CTEs

sfdc_accounts as (
  
    select * from {{ ref('stg_salesforce__accounts') }}
    where is_deleted = false

),

-- Crossbeam CTEs

partners as (
  
    select * from {{ ref('stg_salesforce__crossbeam_overlap') }}
    where is_deleted = 'false'

),

-- Aggregation CTEs

partner_customers as (
    select
        salesforce_account_id as account_id,
        listagg(distinct partner_name,'; ') within group (order by partner_name) as partner_customers
    from partners
    where partner_population = 'Customers'
    group by 1
),

partner_prospects as (
    select
        salesforce_account_id as account_id,
        listagg(distinct partner_name,'; ') within group (order by partner_name) as partner_prospects
    from partners
    where partner_population = 'Prospects'
    group by 1
),

partner_opportunities as (
    select
        salesforce_account_id as account_id,
        listagg(distinct partner_name,'; ') within group (order by partner_name) as partner_opportunities
    from partners
    where partner_population = 'Open Opportunities'
    group by 1
),

warehouse_rollup as (

    select
        sfdc_accounts.account_id,
        sfdc_accounts.account_name,
        partner_customers,
        partner_prospects,
        partner_opportunities
    from sfdc_accounts
        left join partner_customers
            on sfdc_accounts.account_id = partner_customers.account_id
        left join partner_prospects
            on sfdc_accounts.account_id = partner_prospects.account_id
        left join partner_opportunities
            on sfdc_accounts.account_id = partner_opportunities.account_id

)

select *
from warehouse_rollup