with

harvest_clients as (

    select * from {{ ref('stg_harvest__clients') }}
    where is_active

),

services_scheduled as (

    select * from {{ ref('fct_services_delivery') }}
    -- Migrating to process for FY2023 Q4 and forward
    where start_date >= '2022-11-01'
    and customer_name is not null

),

distinct_clients as (

    select distinct
        salesforce_account_id,
        customer_name
    
    from services_scheduled

),

-- Select all to-be-delivered projects that do not have a corresponding client in Harvest
final as (

    select
        distinct_clients.*
    
    from distinct_clients
    left join harvest_clients
        on distinct_clients.salesforce_account_id = harvest_clients.salesforce_account_id
    where harvest_clients.salesforce_account_id is null

)

select * from final