with source as (

    select * from {{ source('salesforce', 'opportunitylineitem') }}

),

renamed as (

    select

        ----------  ids
        id as opportunity_line_item_id,
        createdbyid as created_by_id,
        opportunityid as opportunity_id,
        pricebookentryid as pricebook_entry_id,
        product2id as product_id,
        lastmodifiedbyid as last_modified_by_id,
        sbqq__quoteline__c as sbqq_quote_line_id,
        services_delivered_by__c as services_delivered_by_id,

        ----------  item attributes
        charge_type__c as charge_type,
        name as line_item_name,

        -- account for naming discrepancies
        case
            when product_name__c = 'Rapid Onboarding - Standard'
                then 'dbt Learn, Rapid Onboarding'
            when product_name__c in ('dbt Learn, Group Learn','dbt Learn')
                then 'dbt Learn, Group Training'
            when product_name__c = 'Rapid Onboarding - Lite'
                then 'dbt Learn, Rapid Onboarding - Lite'
            when product_name__c = 'Rapid Onboarding - Plus'
                then 'dbt Learn, Rapid Onboarding - Plus'
            when product_name__c in ('Rapid Onboarding - Standard','Rapid Onboarding')
                then 'dbt Learn, Rapid Onboarding'
            when product_name__c = 'dbt Advance Build Service Hours'
                then 'dbt Advanced Build Service Hours'
            else product_name__c
        end as product_name,

        productcode as product_code,
        description as line_description,
        scheduling_notes__c as scheduling_notes,
        sbqq__subscriptiontype__c as subscription_type,

        -- [Brandon on 8/1/2022] - I'm not entirely sure we want to retain the below logic.
        -- I'll work with CS in a separate PR to make sure this does what we want it to do.

        quantity,
        sortorder as sort_order,

        coalesce(
            product_code = 'service_hour',
            false
        ) as is_service_hour,

        case
            when product_code = 'deployment_vpc'
                and line_item_name not ilike '%jetblue%'
                and totalprice > 0
            -- NOTE: jetblue bought an onprem deployment but did not use it
            -- take into account only onprem deployments that were actually purchased
                then true
            else false
        end as is_on_prem,

        ----------  revenue
        discount / 100 as discount_pct,
        listprice as list_price,
        totalprice as total_price,
        unitprice as unit_price,
        mrr__c as mrr,
        arr__c as arr,
        rate__c as rate,
        subtotal as subtotal_amount,

        ---------- consumption
        quantity_used__c as quantity_used,
        quantity_scheduled__c as quantity_scheduled,
        quantity_deferred__c as quantity_deferred,
        usage_status__c as usage_status,

        ----------  item durations
        duration__c as duration,
        time_unit__c as time_unit,
        ro_training_length__c as rapid_onboarding_length,

        ---------- booleans
        created_after_close_date__c as was_created_after_close_date,
        create_rapid_onboarding_ps_tickets__c as is_rapid_onboarding_ps_ticket_created,

        ---------- dates & timestamps
        desired_start_date__c as desired_start_date,
        servicedate as service_date,
        services_kick_off_date__c::date as services_kicked_off_date,  -- differentiate from service_date & starts_on
        services_delivered_date__c::date as services_delivered_date,  -- differentiate from ends_on
        starts_on__c as starts_on,
        ends_on__c as ends_on,
        lastmodifieddate as last_modified_at,
        createddate as created_at,
        systemmodstamp as system_modstamp

    from source
    where isdeleted = false

)

select * from renamed
