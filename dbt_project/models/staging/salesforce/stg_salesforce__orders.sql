with

source as (

    select * from {{ source('salesforce', 'orders') }}

),

renamed as (

    select
        id as sfdc_order_id,
        accountid as sfdc_account_id,
        opportunityid as sfdc_opportunity_id,
        ownerid as owner_id,
        contractid as contract_id,
        pricebook2id as pricebook2_id,
        createdbyid as created_by_id,

        ordernumber as order_number,
        ponumber as po_number,
        po_required__c as po_required,

        type as order_type,
        status as order_status,
        statuscode as order_status_code,
        description as order_description,
        isreductionorder as is_reduction_order,

        totalamount as total_amount,
        tax_exempt__c as tax_exempt,

        billtocontactid as bill_to_contact_id,
        bill_to_name__c as bill_to_name,
        billingstreet as billing_street,
        billingcity as billing_city,
        billingstate as billing_state,
        billingstatecode as billing_state_code,
        billingpostalcode as billing_postal_code,
        billingcountry as billing_country,
        billingcountrycode as billing_country_code,

        ship_to_name__c as ship_to_name,
        shippingstreet as shipping_street,
        shippingcity as shipping_city,
        shippingstate as shipping_state,
        shippingstatecode as shipping_state_code,
        shippingpostalcode as shipping_postal_code,
        shippingcountry as shipping_country,
        shippingcountrycode as shipping_country_code,

        createddate as created_at,
        effectivedate as effective_date,

        activatedbyid as activated_by_id,
        activateddate as activated_date,

        lastmodifiedbyid as last_modified_by_id,
        lastmodifieddate as last_modified_date,

        isdeleted as is_deleted,

        systemmodstamp as system_modstamp

    from source

)

select * from renamed