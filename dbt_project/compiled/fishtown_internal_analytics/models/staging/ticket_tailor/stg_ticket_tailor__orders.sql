with source as (

    select * from raw.taptickettailor.orders

),

renamed as (

    select
        -- ids  
        id as order_id,
        event_summary:id::string as event_id,
        txn_id as transaction_id,

        buyer_details,
        
        event_summary,
        
        line_items,
        object,
        payment_method,


        -- monetary fields
        currency:code::string as currency_code,
        currency:base_multiplier::integer as base_multipler,
        total / base_multipler as total, 
        subtotal / base_multipler as subtotal,
        tax / base_multipler as tax,
        refund_amount / base_multipler as refund_amount,
        
        
        status,
        status_message,

        
    dateadd(seconds, created_at, '1970-01-01')
 as created_at
        
        
        
        

    from source

)

select * from renamed