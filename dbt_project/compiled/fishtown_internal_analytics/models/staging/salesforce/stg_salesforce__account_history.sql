with

source as (

    select * from raw.salesforce.accounthistory
    where field not in (
        'accountMerged',
        'accountUpdatedByLead',
        'created'
    )

),

renamed as (

    select
        accountid as account_id,
        createdbyid as created_by_id,
        id as account_history_id,

        datatype as data_type,
        field as field_name,

        isdeleted as is_deleted,
        
        newvalue__de as new_value_decimal,
        newvalue__fl as new_value_float,
        newvalue__st as new_value_string,
        newvalue__bo as new_value_boolean,

        createddate as created_at,
        createddate::date as created_date

    from source

),

pivot as (

    select
        account_id,
        created_at,
        created_date,
        
        case
                when field_name = 'ABM_Stage__c' and data_type = 'DynamicEnum'
                    then coalesce(
                        new_value_string,
                        new_value_float,
                        new_value_boolean,
                        new_value_decimal
                    )
                else null
            end as

            abm_stage,

        case
                when field_name = 'BillingCity' and data_type = 'Text'
                    then coalesce(
                        new_value_string,
                        new_value_float,
                        new_value_boolean,
                        new_value_decimal
                    )
                else null
            end as

            billingcity,

        case
                when field_name = 'BillingCountryCode' and data_type = 'DynamicEnum'
                    then coalesce(
                        new_value_string,
                        new_value_float,
                        new_value_boolean,
                        new_value_decimal
                    )
                else null
            end as

            billingcountrycode,

        case
                when field_name = 'BillingLatitude' and data_type = 'Double'
                    then coalesce(
                        new_value_string,
                        new_value_float,
                        new_value_boolean,
                        new_value_decimal
                    )
                else null
            end as

            billinglatitude,

        case
                when field_name = 'BillingLongitude' and data_type = 'Double'
                    then coalesce(
                        new_value_string,
                        new_value_float,
                        new_value_boolean,
                        new_value_decimal
                    )
                else null
            end as

            billinglongitude,

        case
                when field_name = 'BillingPostalCode' and data_type = 'Text'
                    then coalesce(
                        new_value_string,
                        new_value_float,
                        new_value_boolean,
                        new_value_decimal
                    )
                else null
            end as

            billingpostalcode,

        case
                when field_name = 'BillingStateCode' and data_type = 'DynamicEnum'
                    then coalesce(
                        new_value_string,
                        new_value_float,
                        new_value_boolean,
                        new_value_decimal
                    )
                else null
            end as

            billingstatecode,

        case
                when field_name = 'BillingStreet' and data_type = 'MultiLineText'
                    then coalesce(
                        new_value_string,
                        new_value_float,
                        new_value_boolean,
                        new_value_decimal
                    )
                else null
            end as

            billingstreet,

        case
                when field_name = 'Case_Study_Customer_Quote__c' and data_type = 'DynamicEnum'
                    then coalesce(
                        new_value_string,
                        new_value_float,
                        new_value_boolean,
                        new_value_decimal
                    )
                else null
            end as

            case_study_customer_quote,

        case
                when field_name = 'Client_Services_Contact__c' and data_type = 'EntityId'
                    then coalesce(
                        new_value_string,
                        new_value_float,
                        new_value_boolean,
                        new_value_decimal
                    )
                else null
            end as

            client_services_contact_id,

        case
                when field_name = 'Client_Services_Contact__c' and data_type = 'Text'
                    then coalesce(
                        new_value_string,
                        new_value_float,
                        new_value_boolean,
                        new_value_decimal
                    )
                else null
            end as

            client_services_contact,

        case
                when field_name = 'Client_Technical_Contact__c' and data_type = 'Text'
                    then coalesce(
                        new_value_string,
                        new_value_float,
                        new_value_boolean,
                        new_value_decimal
                    )
                else null
            end as

            client_technical_contact,

        case
                when field_name = 'Client_Technical_Contact__c' and data_type = 'EntityId'
                    then coalesce(
                        new_value_string,
                        new_value_float,
                        new_value_boolean,
                        new_value_decimal
                    )
                else null
            end as

            client_technical_contact_id,

        case
                when field_name = 'Customer_Life_Cycle_Phase__c' and data_type = 'DynamicEnum'
                    then coalesce(
                        new_value_string,
                        new_value_float,
                        new_value_boolean,
                        new_value_decimal
                    )
                else null
            end as

            customer_life_cycle_phase,

        case
                when field_name = 'Customer_Reference_s__c' and data_type = 'MultiEnum'
                    then coalesce(
                        new_value_string,
                        new_value_float,
                        new_value_boolean,
                        new_value_decimal
                    )
                else null
            end as

            customer_reference_s,

        case
                when field_name = 'Deployment_SKU__c' and data_type = 'DynamicEnum'
                    then coalesce(
                        new_value_string,
                        new_value_float,
                        new_value_boolean,
                        new_value_decimal
                    )
                else null
            end as

            deployment_sku,

        case
                when field_name = 'Deployment_Type__c' and data_type = 'DynamicEnum'
                    then coalesce(
                        new_value_string,
                        new_value_float,
                        new_value_boolean,
                        new_value_decimal
                    )
                else null
            end as

            deployment_type,

        case
                when field_name = 'Employee_Count_Range__c' and data_type = 'DynamicEnum'
                    then coalesce(
                        new_value_string,
                        new_value_float,
                        new_value_boolean,
                        new_value_decimal
                    )
                else null
            end as

            employee_count_range,

        case
                when field_name = 'HQ_Territory_City__c' and data_type = 'Text'
                    then coalesce(
                        new_value_string,
                        new_value_float,
                        new_value_boolean,
                        new_value_decimal
                    )
                else null
            end as

            hq_territory_city,

        case
                when field_name = 'HQ_Territory_Country__c' and data_type = 'Text'
                    then coalesce(
                        new_value_string,
                        new_value_float,
                        new_value_boolean,
                        new_value_decimal
                    )
                else null
            end as

            hq_territory_country,

        case
                when field_name = 'HQ_Territory_State_Province__c' and data_type = 'Text'
                    then coalesce(
                        new_value_string,
                        new_value_float,
                        new_value_boolean,
                        new_value_decimal
                    )
                else null
            end as

            hq_territory_state_province,

        case
                when field_name = 'HQ_Territory_Street__c' and data_type = 'Text'
                    then coalesce(
                        new_value_string,
                        new_value_float,
                        new_value_boolean,
                        new_value_decimal
                    )
                else null
            end as

            hq_territory_street,

        case
                when field_name = 'HQ_Territory_Zip_Postal_Code__c' and data_type = 'Text'
                    then coalesce(
                        new_value_string,
                        new_value_float,
                        new_value_boolean,
                        new_value_decimal
                    )
                else null
            end as

            hq_territory_zip_postal_code,

        case
                when field_name = 'Logo_Rights__c' and data_type = 'DynamicEnum'
                    then coalesce(
                        new_value_string,
                        new_value_float,
                        new_value_boolean,
                        new_value_decimal
                    )
                else null
            end as

            logo_rights,

        case
                when field_name = 'NumberOfEmployees' and data_type = 'Double'
                    then coalesce(
                        new_value_string,
                        new_value_float,
                        new_value_boolean,
                        new_value_decimal
                    )
                else null
            end as

            numberofemployees,

        case
                when field_name = 'Owner' and data_type = 'EntityId'
                    then coalesce(
                        new_value_string,
                        new_value_float,
                        new_value_boolean,
                        new_value_decimal
                    )
                else null
            end as

            owner_id,

        case
                when field_name = 'Owner' and data_type = 'Text'
                    then coalesce(
                        new_value_string,
                        new_value_float,
                        new_value_boolean,
                        new_value_decimal
                    )
                else null
            end as

            owner,

        case
                when field_name = 'Primary_dbt_Cloud_Account__c' and data_type = 'EntityId'
                    then coalesce(
                        new_value_string,
                        new_value_float,
                        new_value_boolean,
                        new_value_decimal
                    )
                else null
            end as

            primary_dbt_cloud_account_id,

        case
                when field_name = 'Primary_dbt_Cloud_Account__c' and data_type = 'Text'
                    then coalesce(
                        new_value_string,
                        new_value_float,
                        new_value_boolean,
                        new_value_decimal
                    )
                else null
            end as

            primary_dbt_cloud_account,

        case
                when field_name = 'Product_Feature__c' and data_type = 'MultiEnum'
                    then coalesce(
                        new_value_string,
                        new_value_float,
                        new_value_boolean,
                        new_value_decimal
                    )
                else null
            end as

            product_feature,

        case
                when field_name = 'SDR_Owner__c' and data_type = 'Text'
                    then coalesce(
                        new_value_string,
                        new_value_float,
                        new_value_boolean,
                        new_value_decimal
                    )
                else null
            end as

            sdr_owner,

        case
                when field_name = 'SDR_Owner__c' and data_type = 'EntityId'
                    then coalesce(
                        new_value_string,
                        new_value_float,
                        new_value_boolean,
                        new_value_decimal
                    )
                else null
            end as

            sdr_owner_id,

        case
                when field_name = 'Target_Account__c' and data_type = 'Boolean'
                    then coalesce(
                        new_value_string,
                        new_value_float,
                        new_value_boolean,
                        new_value_decimal
                    )
                else null
            end as

            target_account,

        case
                when field_name = 'Technical_Lead__c' and data_type = 'Text'
                    then coalesce(
                        new_value_string,
                        new_value_float,
                        new_value_boolean,
                        new_value_decimal
                    )
                else null
            end as

            technical_lead,

        case
                when field_name = 'Technical_Lead__c' and data_type = 'EntityId'
                    then coalesce(
                        new_value_string,
                        new_value_float,
                        new_value_boolean,
                        new_value_decimal
                    )
                else null
            end as

            technical_lead_id,

        case
                when field_name = 'TextName' and data_type = 'Text'
                    then coalesce(
                        new_value_string,
                        new_value_float,
                        new_value_boolean,
                        new_value_decimal
                    )
                else null
            end as

            textname,

        case
                when field_name = 'Tier_1_Support__c' and data_type = 'DynamicEnum'
                    then coalesce(
                        new_value_string,
                        new_value_float,
                        new_value_boolean,
                        new_value_decimal
                    )
                else null
            end as

            tier_1_support,

        case
                when field_name = 'Toggle_to_Sync_to_Zendesk__c' and data_type = 'Boolean'
                    then coalesce(
                        new_value_string,
                        new_value_float,
                        new_value_boolean,
                        new_value_decimal
                    )
                else null
            end as

            toggle_to_sync_to_zendesk,

        case
                when field_name = 'Value_Drivers__c' and data_type = 'MultiEnum'
                    then coalesce(
                        new_value_string,
                        new_value_float,
                        new_value_boolean,
                        new_value_decimal
                    )
                else null
            end as

            value_drivers

        from renamed

),

collapse_to_daily_grain as (

    select
        account_id,

        last_value(abm_stage) ignore nulls over (
                partition by account_id, created_date
                order by created_at asc
            ) as abm_stage,

        last_value(billingcity) ignore nulls over (
                partition by account_id, created_date
                order by created_at asc
            ) as billingcity,

        last_value(billingcountrycode) ignore nulls over (
                partition by account_id, created_date
                order by created_at asc
            ) as billingcountrycode,

        last_value(billinglatitude) ignore nulls over (
                partition by account_id, created_date
                order by created_at asc
            ) as billinglatitude,

        last_value(billinglongitude) ignore nulls over (
                partition by account_id, created_date
                order by created_at asc
            ) as billinglongitude,

        last_value(billingpostalcode) ignore nulls over (
                partition by account_id, created_date
                order by created_at asc
            ) as billingpostalcode,

        last_value(billingstatecode) ignore nulls over (
                partition by account_id, created_date
                order by created_at asc
            ) as billingstatecode,

        last_value(billingstreet) ignore nulls over (
                partition by account_id, created_date
                order by created_at asc
            ) as billingstreet,

        last_value(case_study_customer_quote) ignore nulls over (
                partition by account_id, created_date
                order by created_at asc
            ) as case_study_customer_quote,

        last_value(client_services_contact) ignore nulls over (
                partition by account_id, created_date
                order by created_at asc
            ) as client_services_contact_id,

        last_value(client_services_contact) ignore nulls over (
                partition by account_id, created_date
                order by created_at asc
            ) as client_services_contact,

        last_value(client_technical_contact) ignore nulls over (
                partition by account_id, created_date
                order by created_at asc
            ) as client_technical_contact,

        last_value(client_technical_contact) ignore nulls over (
                partition by account_id, created_date
                order by created_at asc
            ) as client_technical_contact_id,

        last_value(customer_life_cycle_phase) ignore nulls over (
                partition by account_id, created_date
                order by created_at asc
            ) as customer_life_cycle_phase,

        last_value(customer_reference_s) ignore nulls over (
                partition by account_id, created_date
                order by created_at asc
            ) as customer_reference_s,

        last_value(deployment_sku) ignore nulls over (
                partition by account_id, created_date
                order by created_at asc
            ) as deployment_sku,

        last_value(deployment_type) ignore nulls over (
                partition by account_id, created_date
                order by created_at asc
            ) as deployment_type,

        last_value(employee_count_range) ignore nulls over (
                partition by account_id, created_date
                order by created_at asc
            ) as employee_count_range,

        last_value(hq_territory_city) ignore nulls over (
                partition by account_id, created_date
                order by created_at asc
            ) as hq_territory_city,

        last_value(hq_territory_country) ignore nulls over (
                partition by account_id, created_date
                order by created_at asc
            ) as hq_territory_country,

        last_value(hq_territory_state_province) ignore nulls over (
                partition by account_id, created_date
                order by created_at asc
            ) as hq_territory_state_province,

        last_value(hq_territory_street) ignore nulls over (
                partition by account_id, created_date
                order by created_at asc
            ) as hq_territory_street,

        last_value(hq_territory_zip_postal_code) ignore nulls over (
                partition by account_id, created_date
                order by created_at asc
            ) as hq_territory_zip_postal_code,

        last_value(logo_rights) ignore nulls over (
                partition by account_id, created_date
                order by created_at asc
            ) as logo_rights,

        last_value(numberofemployees) ignore nulls over (
                partition by account_id, created_date
                order by created_at asc
            ) as numberofemployees,

        last_value(owner) ignore nulls over (
                partition by account_id, created_date
                order by created_at asc
            ) as owner_id,

        last_value(owner) ignore nulls over (
                partition by account_id, created_date
                order by created_at asc
            ) as owner,

        last_value(primary_dbt_cloud_account) ignore nulls over (
                partition by account_id, created_date
                order by created_at asc
            ) as primary_dbt_cloud_account_id,

        last_value(primary_dbt_cloud_account) ignore nulls over (
                partition by account_id, created_date
                order by created_at asc
            ) as primary_dbt_cloud_account,

        last_value(product_feature) ignore nulls over (
                partition by account_id, created_date
                order by created_at asc
            ) as product_feature,

        last_value(sdr_owner) ignore nulls over (
                partition by account_id, created_date
                order by created_at asc
            ) as sdr_owner,

        last_value(sdr_owner) ignore nulls over (
                partition by account_id, created_date
                order by created_at asc
            ) as sdr_owner_id,

        last_value(target_account) ignore nulls over (
                partition by account_id, created_date
                order by created_at asc
            ) as target_account,

        last_value(technical_lead) ignore nulls over (
                partition by account_id, created_date
                order by created_at asc
            ) as technical_lead,

        last_value(technical_lead) ignore nulls over (
                partition by account_id, created_date
                order by created_at asc
            ) as technical_lead_id,

        last_value(textname) ignore nulls over (
                partition by account_id, created_date
                order by created_at asc
            ) as textname,

        last_value(tier_1_support) ignore nulls over (
                partition by account_id, created_date
                order by created_at asc
            ) as tier_1_support,

        last_value(toggle_to_sync_to_zendesk) ignore nulls over (
                partition by account_id, created_date
                order by created_at asc
            ) as toggle_to_sync_to_zendesk,

        last_value(value_drivers) ignore nulls over (
                partition by account_id, created_date
                order by created_at asc
            ) as value_drivers,

        created_date

    from pivot
    -- Last record per day
    qualify row_number() over (partition by account_id, created_date order by created_at asc) = 1

),

final as (

    select
        * exclude (created_date),
        created_date as valid_from,
        lead(created_date) over (partition by account_id order by created_date) as valid_to
        
    from collapse_to_daily_grain

)

select * from final