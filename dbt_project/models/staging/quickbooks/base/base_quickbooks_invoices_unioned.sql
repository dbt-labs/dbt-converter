with 

base as (

    {{ dbt_utils.union_relations(
        relations=[
            source('quickbooks', 'invoices'),
            source('quickbooks_inc', 'invoices')]
    ) }}

),

parsed as (

    select

        {{  dbt_utils.generate_surrogate_key([
            "split_part(_dbt_source_relation,'.',2)",
            'id']) }}
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

        {{  dbt_utils.generate_surrogate_key([
            "split_part(_dbt_source_relation,'.',2)",
            "customerref['value']::varchar"])}}
            as quickbooks_customer_id,

        metadata['CreateTime']::timestamp as created_at,
        metadata['LastUpdatedTime']::timestamp as updated_at,
        line as lines,
        
        lines ilike '%open invoice%' as is_open_invoice

    from base

)

select * from parsed