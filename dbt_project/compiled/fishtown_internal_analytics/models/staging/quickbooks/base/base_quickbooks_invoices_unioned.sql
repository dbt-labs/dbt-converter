with 

base as (

    

        (
            select
                cast('raw.quickbooks.quickbooks_invoices' as TEXT) as _dbt_source_relation,

                

            from raw.quickbooks.quickbooks_invoices

            
        )

        union all
        

        (
            select
                cast('raw.quickbooks_inc.quickbooks_invoices' as TEXT) as _dbt_source_relation,

                

            from raw.quickbooks_inc.quickbooks_invoices

            
        )

        

),

parsed as (

    select

        md5(cast(coalesce(cast(split_part(_dbt_source_relation,'.',2) as TEXT), '') || '-' || coalesce(cast(id as TEXT), '') as TEXT))
            as invoice_id,

        case split_part(_dbt_source_relation,'.',2)
            when 'quickbooks' then 'llc'
            when 'quickbooks_inc' then 'inc'
            else 'error'
        end as quickbooks_account,
        id::int as internal_id,
        totalamt as total_amt,
        txndate::date as txn_date,
        duedate::date as due_date,
        balance,
        deliveryinfo['DeliveryType']::varchar as delivery_type,
        deliveryinfo['DeliveryTime']::timestamp as delivery_time,
        emailstatus as email_status,
        docnumber as doc_number,

        md5(cast(coalesce(cast(split_part(_dbt_source_relation,'.',2) as TEXT), '') || '-' || coalesce(cast(customerref['value']::varchar as TEXT), '') as TEXT))
            as quickbooks_customer_id,

        metadata['CreateTime']::timestamp as created_at,
        metadata['LastUpdatedTime']::timestamp as updated_at,
        line as lines,
        
        lines ilike '%open invoice%' as is_open_invoice

    from base

)

select * from parsed