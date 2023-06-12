with 

source as (

    select * from raw.bizzabo.registrations

),

renamed as (

    select
        id as registration_id,
        contactid as contact_id,
        eventid as event_id,
        orderid as order_id,
        ticketid as ticket_id,

        parse_json(billingaddress) as billing_address_properties,
        charge/100 as charge_amount,
        currency as currency_code,
        fees/100 as fees_amount,
        invoice as has_invoice,
        magiclink as magic_link,
        manageregistrationlink as manage_registration_link,
        ordertype as order_type,
        paymentmethod as payment_method,
        paymentstatus as payment_status,
        promocode as promo_code,
        promoname as promo_name,
        price/100 as ticket_price,
        parse_json(properties) as registrant_properties,
        parse_json(sessionscheckin) as session_checkins,
        status,
        ticketname as ticket_name,
        utmcampaign as marketing_campaign,
        utmcontent as marketing_content,
        utmmedium as marketing_medium,
        utmsource as marketing_source,
        validity,

        checkedin as is_checked_in,
        virtualcheckin as is_virtual_checkin,

        created as created_at,      
        modified as modified_at,
        paymentdate as payment_at,
        registrationdate as registered_at,
        checkedindate as checked_in_at,
        _sdc_batched_at

    from source

)

select * from renamed