{{
  config(
    materialized = 'table'
  )
}}

with

source as (

    select * from {{ source('salesforce', 'products') }}

),

/*
TECH-DEBT
5 Aug 2022 - Erica Louie
We should think about categorizing by the item type, for example:
- Licenses that are seats
- General charge for Cloud itself
- Pro-Serve hours
- Rapid Onboarding, etc

This will allow us to see the number of purchased seats and other
segmentations by the products that managed accounts buy but may
not be utilizing
*/

renamed as (

    select
        id as product_id,
        createdbyid as created_by_id,
        lastmodifiedbyid as last_modified_by_id,

        -- account for weirdly named product
        case
            when name = 'dbt Advance Build Service Hours'
                then 'dbt Advanced Build Service Hours'
            else name
        end as product_name,

        family as product_family,

        service_type__c as service_type,
        case
            when service_type__c = 'Pro-Serv'
                then 'professional services'
            when service_type__c = 'Training/Onboarding'
                then 'training'
            when family in ('Cloud Licenses','Deployments')
                then 'enterprise'
            when family = 'Services'
                then 'services'
            else 'other'
        end as product_type,

        case
          when service_type__c = 'Pro-Serv'
            then true
          else false
        end as is_professional_services,

        case
          when service_type__c = 'Training/Onboarding'
            then true
          else false
        end as is_training,

        case
            when product_name in (
                  --  need to get these cleaned up in sfdc
                  'Service Hour',
                  'dbt Advanced Build Service Hours',
                  'dbt Advanced Build Services',
                  'dbt Deploy Hours',
                  'dbt PS Service Hours',
                  'dbt PS Advanced Build Services',
                  'dbt PS Resident Architect',
                  'dbt PS Advanced Build Services',
                  'dbt PS Solution Review',
                  'dbt PS Analytics Engineering as a Service'
                  )
              then 'Hour'
            when productcode in ('develop', 'platform')
              then quantityunitofmeasure
            when productcode = 'read' then 'Seat'
            when productcode = 'deployment_vpc' then 'Deployment'
            else null
        end as unit,

        case
            when product_type = 'enterprise'
                then 'dbt cloud enterprise'
            when product_type = 'services'
                then 'dbt cloud services'
            else product_type
        end as product_description,

        isactive as is_active,
        isdeleted as is_deleted,
        is_recurring__c as is_recurring,
        productcode as product_code,
        quantityunitofmeasure as quantity_unit_of_measure,
        sbqq__taxable__c as taxable,
        time_unit__c as time_unit,

        sbqq__subscriptionterm__c as subscription_term,
        sbqq__chargetype__c as charge_type,
        sbqq__subscriptiontype__c as subscription_type,
        sbqq__subscriptionpricing__c as subscription_pricing,

        sbqq__billingtype__c as billing_type,
        blng__billingrule__c as billing_rule,
        sbqq__billingfrequency__c as billing_frequency,
        blng__taxrule__c as tax_rule,
        blng__revenuerecognitionrule__c as revenue_recognition_rule,

        product_type = 'services' as is_professional_services_item,
        sbqq__quantityeditable__c as is_quantity_editable,
        sbqq__priceeditable__c as is_price_editable,
        sbqq__hidden__c as is_hidden,
        sbqq__nondiscountable__c as is_nondiscountable,
        sbqq__nonpartnerdiscountable__c as is_nonpartner_discountable,
        sbqq__hasconsumptionschedule__c as is_has_consumption_schedule,
        sbqq__descriptionlocked__c as is_description_locked,
        sbqq__enablelargeconfiguration__c as is_enable_large_configuration,
        sbqq__excludefrommaintenance__c as is_exclude_from_maintenance,
        sbqq__externallyconfigurable__c as is_externally_configurable,
        sbqq__newquotegroup__c as is_new_quote_group,
        sbqq__customconfigurationrequired__c as is_custom_required,
        sbqq__costeditable__c as is_costeditable,
        sbqq__hasconfigurationattributes__c as is_has_configuration_attributes,
        sbqq__optional__c as is_optional,
        sbqq__hidepriceinsearchresults__c as is_hidepriceinsearchresults,
        sbqq__reconfigurationdisabled__c as is_reconfigurationdisabled,
        sbqq__includeinmaintenance__c as is_includeinmaintenance,
        sbqq__component__c as is_component,
        sbqq__excludefromopportunity__c as is_exclude_from_opportunity,
        sbqq__pricingmethodeditable__c as is_pricing_method_editable,

        credit_note_credit__c as credit_note_credit,
        credit_note_debit__c as credit_note_debit,

        invoice_credit__c as invoice_credit,
        invoice_debit__c as invoice_debit,

        payment_credit__c as payment_credit,
        payment_debit__c as payment_debit,

        refund_credit__c as refund_credit,
        refund_debit__c as refund_debit,

        rev_rec_credit__c as rev_rec_credit,
        rev_rec_debit__c as rev_rec_debit,

        lastmodifieddate as last_modified_date,
        lastreferenceddate as last_referenced_date,
        lastvieweddate as last_viewed_at,
        createddate as created_at,
        systemmodstamp as system_modstamp

    from source

)

select * from renamed
