with

source as (

    select * from {{ source('salesforce', 'order_items') }}

),

renamed as (

    select
        id as sfdc_order_item_id,
        orderid as sfdc_order_id,
        createdbyid as created_by_id,
        pricebookentryid as pricebook_entry_id,
        product2id as sfdc_product_id,

        orderitemnumber as order_item_number,

        listprice as list_price,
        unitprice as unit_price,
        quantity,
        availablequantity as available_quantity,
        totalprice as total_price,


        createddate as created_at,
        servicedate::date as service_start_date,
        enddate::date as service_end_date,

        lastmodifiedbyid as last_modified_by_id,
        lastmodifieddate as last_modified_date,

        isdeleted as is_deleted,

        systemmodstamp as system_modstamp,
        _sdc_batched_at,
        _sdc_extracted_at,
        _sdc_received_at,
        _sdc_sequence,
        _sdc_table_version

    from source

)

select * from renamed