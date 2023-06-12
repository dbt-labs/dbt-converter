
  create or replace   view analytics_dev.dbt_jstein.base__salesforce_accounts
  
   as (
    with source as (

    select * from raw.salesforce.account

),

renamed as (

    select

        ---------- identifiers
        id as account_id,
        ownerid as account_owner_id,
        parentid as parent_id,
        createdbyid as created_by_id,
        lastmodifiedbyid as last_modified_by_id,
        technical_lead__c as technical_lead_id,
        cbit__clearbit__c as clearbit_id,
        client_technical_contact__c as client_technical_contact_id,

        ---------- booleans
        id in 

(
    '0016g00000EFCncAAH', -- Fishtown Analytics
    '0014v00002OxoX7AAJ', -- dbt Labs
    '0014v00002Id1ZEAAZ' -- James's Test Account
)

 as is_internal_account,
        isdeleted as is_deleted,
        target_account__c as is_target_account,
        coalesce(
            p1_team_migration_account__c,
            false
        ) as is_p1_team_migration_account,

        ---------- account attributes
        name as account_name,
        accountsource as account_source,
        status__c as account_status,
        type as account_type,
        health__c as account_health,
        relationship__c as account_relationship,

        ---------- customer demographic
        description,
        website,
        primary_domain__c as primary_domain,
        phone,
        photourl,
        employee_count_range__c as employee_count_range,
        numberofemployees as number_of_employees,
        split_part(territory_label__c, ' - ', 1)  as territory,
        hq_territory_country__c as hq_territory_country,
        region__c as account_region,
        subregion__c as account_subregion,
        market_segment__c as market_segment,
        industry,
        dei_research_notes__c as dei_research_notes,

        ---------- social network
        linkedin_does_not_exist__c as linkedin_does_not_exist,
        linkedin_page__c as linkedin_page,
        linkedin_slug__c as linkedin_slug,

        crunchbase_page__c as crunchbase_page,
        crunchbase_slug__c,

        ---------- billing
        billingcity as billing_city,
        billingcountry as billing_country,
        billingcountrycode as billing_country_code,
        billingpostalcode as billing_postal_code,
        billingstate as billing_state,
        billingstatecode as billing_state_code,
        billingstreet as billing_street,

        ---------- shipping
        shippingcity as shipping_city,
        shippingcountry as shipping_country,
        shippingcountrycode as shipping_country_code,
        shippingpostalcode as shipping_postal_code,
        shippingstate as shipping_state,
        shippingstatecode as shipping_state_code,
        shippingstreet as shipping_street,

        ---------- lifecycle
        customer_life_cycle_phase__c as customer_life_cycle_phase,
        customer_health__c as customer_health,
        customer_reference_s__c as customer_references,
        customer_reference_contact_email__c as customer_reference_contact_email,
        managed_segment_dbt_cloud__c as managed_segment_dbt_cloud,
        tier_1_support__c as tier_1_support,
        strategic_support_engineer__c as strategic_support_engineer,
        
        of_partnerships__c as number_of_verified_partnerships,
        of_all_partnerships__c as number_of_all_partnerships,

        first_subscription_opportunity__c as first_subscription_opportunity,
        last_subscription_opportunity__c as last_subscription_opportunity,
        last_subscription_term_opportunity__c as last_subscription_term_opportunity,
        life_time_value__c as life_time_value,

        ---------- deployment
        deployment_type__c as deployment_type,
        deployment_sku__c as deployment_sku, 
        why_single_tenant_deployment_type__c as why_single_tenant_deployment_type, 
        why_single_tenant_deployment_type_detail__c as why_single_tenant_deployment_type_detail,

        ---------- technographic information
        bi_analytics_tools__c as bi_analytics_tools,
        bi_analytics_tools_other__c as bi_analytics_tools_other,
        current_data_transformation_tool__c as current_data_transformation_tool,
        data_warehouse__c as data_warehouse,
        data_warehouse_access__c as data_warehouse_access,
        git_provider__c as git_provider,
        git_provider_access__c as git_provider_access,
        identity_provider__c as identity_provider,
        orchestrator__c as orchestrator,
        orchestrator_other__c as orchestrator_other,
        preferred_cloud_platform__c as preferred_cloud_platform,

        ---------- value drivers
        split_part(value_drivers__c, ';', 1) as value_driver_1,
        split_part(value_drivers__c, ';', 2) as value_driver_2,
        split_part(value_drivers__c, ';', 3) as value_driver_3,
        split_part(product_feature__c, ';', 1) as value_driver_product_feature_1,
        split_part(product_feature__c, ';', 2) as value_driver_product_feature_2,
        split_part(product_feature__c, ';', 3) as value_driver_product_feature_3,
        primary_driver_of_enterprise__c as primary_driver_of_enterprise,

        ----------  zoominfo
        ZI_COMPANY_INDUSTRY__C as zoominfo_industry,
        ZI_COMPANY_REVENUE__C AS zoominfo_company_revenue,

        ----------  arr
        current_arr__c as current_arr,
        starting_arr__c as starting_arr,

        ----------  dates and timestamps
        createddate as created_at,
        to_date(createddate) as created_date,
        lastmodifieddate as last_modified_at,
        lastreferenceddate as last_referenced_at,
        lastvieweddate as last_viewed_at,
        lastactivitydate as last_activity_at,
        land_on__c as landed_at,
        current_term_end__c as current_term_end,
        current_term_start__c as current_term_start,
        systemmodstamp,
        last_gong_call__c as last_gong_call,
        last_activity_1_way__c as last_activity_1_way,
        last_contact_two_way__c as last_contact_two_way,
        last_sent_email__c as last_sent_email,
        last_recv_email__c as last_recv_email, 

        ---------- extraction metadata
        _sdc_batched_at,
        _sdc_extracted_at,
        _sdc_received_at,
        _sdc_sequence,
        _sdc_table_version

    from source

)

select * from renamed
  );

