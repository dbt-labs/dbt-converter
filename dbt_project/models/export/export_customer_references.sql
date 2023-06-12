with

salesforce_accounts as (

    select * from {{ ref('dim_salesforce_accounts') }}
    where is_internal_account = false
        and customer_references is not null
        and not customer_references ilike ('none')

),

cloud_account_mappings as (

    select * from {{ ref('cloud_account_mappings') }}

),

final as (

    select
        salesforce_accounts.account_id,
        salesforce_accounts.account_name,
        salesforce_accounts.owner_name,

        -- For multi-select lists Notion requires array-type data instead of strings
        strtok_to_array(salesforce_accounts.data_warehouse,';') as data_warehouse,
        strtok_to_array(salesforce_accounts.customer_references,';') as customer_references,
    
        -- The comma was driving an error in Notion, so this just eliminates it
        replace(salesforce_accounts.employee_count_range,',','') as employee_count_range,
        
        salesforce_accounts.customer_health,
        salesforce_accounts.git_provider,
        salesforce_accounts.clearbit_industry_group,
        salesforce_accounts.account_region,
        salesforce_accounts.territory,
        salesforce_accounts.hq_territory_country,
        salesforce_accounts.landed_at::date as landed_at,
        salesforce_accounts.current_term_end::date as current_term_end,
        salesforce_accounts.primary_cloud_account_id,
        
        cloud_account_mappings.cloud_account_name,
        cloud_account_mappings.plan,
        cloud_account_mappings.plan_tier,

        -- The below logic is creating a URL so end-users can easily link out to other tools
        case
            when salesforce_accounts.primary_cloud_account_id is not null then
                concat(
                    'https://fishtown.looker.com/dashboards/74?Account+ID=',
                    salesforce_accounts.primary_cloud_account_id,
                    '&Account+Name=',
                    cloud_account_mappings.cloud_account_name,
                    '&Plan=enterprise%2Cteam'
                )
            else null
        end as customer_360_url,

        salesforce_accounts.business_case_overview_video_url,
        salesforce_accounts.salesforce_account_url,
        
        -- the current_timetsamp is being used to force refresh every row in the Notion database
        -- this is required since old values won't be removed (as a result of the upsert process)
        -- this allows us to understand which records were synced so that the team can identify old records
        current_timestamp() as last_synced_at

    from salesforce_accounts
    left join cloud_account_mappings
        on salesforce_accounts.primary_cloud_account_id = cloud_account_mappings.account_id
  
)

select * from final