with invoices as (
    
    select * from analytics_dev.dbt_jstein.base_quickbooks_invoices_unioned
    
),

flattened as (
    
    select

        invoices.*,
        --this id is only unique within a given invoice_id; may also want to create a globally unique id for this table.
        lines.index as id,
        lines.value['Description']::varchar as description,
        lines.value['Amount']::numeric as amount,
        lines.value['SalesItemLineDetail']['ClassRef']['value']::varchar 
            as class_id,
        lines.value['SalesItemLineDetail']['ItemRef']['value']::varchar 
            as item_id,
            
        item_id = 7 as is_professional_services_item,
        item_id = 22 and description ilike '%sales%tax%' as is_sales_tax_line_item

    from invoices,
    lateral flatten(input => invoices.lines) lines
    
    where lines.value['DetailType']::varchar = 'SalesItemLineDetail'    
    
),

with_key as (
    
    select

        *,
        
    
md5(cast(coalesce(cast(id as TEXT), '') || '-' || coalesce(cast(invoice_id as TEXT), '') as TEXT)) as invoice_line_id

    from flattened

)

select * from with_key