with
-- Salesforce Information CTEs

sfdc_accounts as (
  
    select * from {{ ref('stg_salesforce__accounts') }}
    where is_deleted = false

),

-- Cloud Account CTEs

cloud_account_mappings as (

    select * from {{ ref('cloud_account_mappings') }}

),

adapters as (

    select * from {{ ref('fct_cloud_project_connections') }}

),

-- Crossbeam CTEs

partners as (

    select * from {{ ref('stg_salesforce__crossbeam_overlap') }}
    where is_deleted = false

),

-- Aggregation CTEs

adapters_aggregated as (

    select
        salesforce_account_id,
        listagg(distinct adapter,', ') within group (order by adapter) as adapters_used

    from adapters
    left join cloud_account_mappings
        on adapters.account_id = cloud_account_mappings.account_id
    group by 1

),

-- We use this CTE to see which Salesforce accounts have cloud accounts with adapters setup. It gets joined to Salesforce Accounts in later logic.

cloud_account_adapters_join as (

    select
        sfdc_accounts.account_id as salesforce_account_id,
        adapters_aggregated.adapters_used as adapters_used

    from sfdc_accounts
    left join adapters_aggregated
        on adapters_aggregated.salesforce_account_id = sfdc_accounts.account_id
    group by 1,2

),

-- We use this CTE to see which Salesforce accounts have Crossbeam partner customer relationships. It gets aggregated then joined alongside cloud_account_adapters_join to Salesforce Accounts in later logic.

filter_partners as (

    select
        salesforce_account_id as account_id,
        partner_name as partner
    from partners
    where partner_name IN ('Snowflake', 'Databricks', 'Dremio', 'Starburst')
    and partner_population = 'Customers'
    group by 1,2

),

aggregate_partners as (
    select
        account_id,
        listagg(partner,' | ') within group (order by partner) as partner_warehouse_data
    from filter_partners
    group by 1
),

warehouse_rollup as (

    select
        salesforce_account_id,
        adapters_used,
        partner_warehouse_data,
        case
            when adapters_used LIKE '%snowflake%' = true or partner_warehouse_data LIKE '%Snowflake%' = true then 'Snowflake;' else ''
                end as snowflake,
        case
            when adapters_used LIKE '%databricks%' = true or partner_warehouse_data LIKE '%Databricks%' = true then 'Databricks;' else ''
                end as databricks,
        case
            when adapters_used LIKE '%bigquery%' = true then 'BigQuery;' else ''
                end as bigquery,
        case
            when adapters_used LIKE '%redshift%' = true then 'Redshift;' else ''
                end as redshift,
        case
            when adapters_used LIKE '%postgres%' = true then 'Postgres;' else ''
                end as postgres,
        case
            when partner_warehouse_data LIKE '%Dremio%' = true then 'Dremio;' else ''
                end as dremio,
        case
            when partner_warehouse_data LIKE '%Starburst%' = true then 'Starburst / Trino / Presto;' else ''
                end as starburst,
        concat(snowflake,databricks,bigquery,redshift,postgres,dremio,starburst) as warehouse,
        case
            when right(warehouse,1) = ';' then substring(warehouse,1,len(warehouse)-1) else ''
                end as warehouse_clean
    from cloud_account_adapters_join
        left join aggregate_partners
            on cloud_account_adapters_join.salesforce_account_id = aggregate_partners.account_id

),

predicted_data_warehouses as(
    select
        salesforce_account_id as account_id,
        warehouse_clean as predicted_data_warehouse
    from warehouse_rollup

)

select *
from predicted_data_warehouses