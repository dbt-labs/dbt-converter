
  create or replace   view analytics_dev.dbt_jstein.stg_salesforce__accounts
  
   as (
    with accounts as (

    select * from analytics_dev.dbt_jstein.base__salesforce_accounts

),

region_lookup as (

    select * from analytics_dev.dbt_jstein.country_to_region_mappings
    -- here we are forcing clearbit-sourced country names since this is what we utilize in Salesforce
    where data_source = 'clearbit'

),

-- Clearbit contains account enrichment information such as: sector, industry, industry group, etc.
clearbit as (

    select * from analytics_dev.dbt_jstein.stg_salesforce__clearbit
    where is_deleted = false

),

joined as (

    select

        "ACCOUNT_ID",
  "ACCOUNT_OWNER_ID",
  "PARENT_ID",
  "CREATED_BY_ID",
  "LAST_MODIFIED_BY_ID",
  "TECHNICAL_LEAD_ID",
  "CLEARBIT_ID",
  "CLIENT_TECHNICAL_CONTACT_ID",
  "IS_INTERNAL_ACCOUNT",
  "IS_DELETED",
  "IS_TARGET_ACCOUNT",
  "IS_P1_TEAM_MIGRATION_ACCOUNT",
  "ACCOUNT_NAME",
  "ACCOUNT_SOURCE",
  "ACCOUNT_STATUS",
  "ACCOUNT_TYPE",
  "ACCOUNT_HEALTH",
  "ACCOUNT_RELATIONSHIP",
  "DESCRIPTION",
  "WEBSITE",
  "PRIMARY_DOMAIN",
  "PHONE",
  "PHOTOURL",
  "EMPLOYEE_COUNT_RANGE",
  "NUMBER_OF_EMPLOYEES",
  "TERRITORY",
  "HQ_TERRITORY_COUNTRY",
  "ACCOUNT_REGION",
  "ACCOUNT_SUBREGION",
  "MARKET_SEGMENT",
  "INDUSTRY",
  "DEI_RESEARCH_NOTES",
  "LINKEDIN_DOES_NOT_EXIST",
  "LINKEDIN_PAGE",
  "LINKEDIN_SLUG",
  "CRUNCHBASE_PAGE",
  "CRUNCHBASE_SLUG__C",
  "BILLING_CITY",
  "BILLING_COUNTRY_CODE",
  "BILLING_POSTAL_CODE",
  "BILLING_STATE",
  "BILLING_STATE_CODE",
  "BILLING_STREET",
  "SHIPPING_CITY",
  "SHIPPING_COUNTRY",
  "SHIPPING_COUNTRY_CODE",
  "SHIPPING_POSTAL_CODE",
  "SHIPPING_STATE",
  "SHIPPING_STATE_CODE",
  "SHIPPING_STREET",
  "CUSTOMER_LIFE_CYCLE_PHASE",
  "CUSTOMER_HEALTH",
  "CUSTOMER_REFERENCES",
  "CUSTOMER_REFERENCE_CONTACT_EMAIL",
  "MANAGED_SEGMENT_DBT_CLOUD",
  "TIER_1_SUPPORT",
  "STRATEGIC_SUPPORT_ENGINEER",
  "NUMBER_OF_VERIFIED_PARTNERSHIPS",
  "NUMBER_OF_ALL_PARTNERSHIPS",
  "FIRST_SUBSCRIPTION_OPPORTUNITY",
  "LAST_SUBSCRIPTION_OPPORTUNITY",
  "LAST_SUBSCRIPTION_TERM_OPPORTUNITY",
  "LIFE_TIME_VALUE",
  "DEPLOYMENT_TYPE",
  "DEPLOYMENT_SKU",
  "WHY_SINGLE_TENANT_DEPLOYMENT_TYPE",
  "WHY_SINGLE_TENANT_DEPLOYMENT_TYPE_DETAIL",
  "BI_ANALYTICS_TOOLS",
  "BI_ANALYTICS_TOOLS_OTHER",
  "CURRENT_DATA_TRANSFORMATION_TOOL",
  "DATA_WAREHOUSE",
  "DATA_WAREHOUSE_ACCESS",
  "GIT_PROVIDER",
  "GIT_PROVIDER_ACCESS",
  "IDENTITY_PROVIDER",
  "ORCHESTRATOR",
  "ORCHESTRATOR_OTHER",
  "PREFERRED_CLOUD_PLATFORM",
  "VALUE_DRIVER_1",
  "VALUE_DRIVER_2",
  "VALUE_DRIVER_3",
  "VALUE_DRIVER_PRODUCT_FEATURE_1",
  "VALUE_DRIVER_PRODUCT_FEATURE_2",
  "VALUE_DRIVER_PRODUCT_FEATURE_3",
  "PRIMARY_DRIVER_OF_ENTERPRISE",
  "ZOOMINFO_INDUSTRY",
  "ZOOMINFO_COMPANY_REVENUE",
  "CURRENT_ARR",
  "STARTING_ARR",
  "CREATED_AT",
  "CREATED_DATE",
  "LAST_MODIFIED_AT",
  "LAST_REFERENCED_AT",
  "LAST_VIEWED_AT",
  "LAST_ACTIVITY_AT",
  "LANDED_AT",
  "CURRENT_TERM_END",
  "CURRENT_TERM_START",
  "SYSTEMMODSTAMP",
  "LAST_GONG_CALL",
  "LAST_ACTIVITY_1_WAY",
  "LAST_CONTACT_TWO_WAY",
  "LAST_SENT_EMAIL",
  "LAST_RECV_EMAIL",
  "_SDC_BATCHED_AT",
  "_SDC_EXTRACTED_AT",
  "_SDC_RECEIVED_AT",
  "_SDC_SEQUENCE",
  "_SDC_TABLE_VERSION",

        concat(
            'https://fishtown.lightning.force.com/lightning/r/Account/',
            account_id,
            '/view'
        ) as salesforce_account_url,

        coalesce(
            region_lookup.country_name,
            billing_country
        ) as billing_country,

        region_lookup.region_category as billing_region_category,

        clearbit.clearbit_company_type,
        clearbit.clearbit_industry,
        clearbit.clearbit_industry_group,
        clearbit.clearbit_sector,
        clearbit.clearbit_sub_industry,
        clearbit.clearbit_year_company_founded
        

    from accounts
    left join region_lookup
        on accounts.billing_country_code = region_lookup.country_code
    left join clearbit using (clearbit_id)

)

select * from joined
  );

