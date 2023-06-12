with source as (

    select * from raw.salesforce.sbqq__quote__c

),

--Fields that are just another field formated differently are commented out below
renamed as (

    select


        ------------  ids
        id as quote_id,
        ownerid as quote_owner_id,
        createdbyid as created_by_id,
        lastmodifiedbyid as last_modified_by_id,
        sbqq__pricebookid__c as price_book_id,
        sbqq__account__c as account_id,
        sbqq__opportunity2__c as opportunity_id,
        sbqq__mastercontract__c as master_contract_id,
        sbqq__primarycontact__c as primary_contact_id,
        sbqq__salesrep__c as sales_rep_id,
        submitteduser__c as submitted_user_id,
        

        ------------  booleans
        auto_renewal__c as is_auto_renewal,
        --auto_renew_yes_no__c as auto_renew_yes_no,
        ava_sfcpq__automaticvalidateaddress__c as is_automatic_validate_address,
        ava_sfcpq__is_seller_importer_of_record__c as is_seller_importer_of_record,
        ava_sfcpq__quote_automatetaxcalculation__c as is_quote_automate_tax_calculation,
        case_study__c as is_case_study,
        isdeleted as is_deleted,
        logo_rights__c as is_logo_rights,
        payment__c as is_payment,
        sbqq__consumptionrateoverride__c as is_consumption_rate_override,
        sbqq__lineitemsgrouped__c as is_line_items_grouped,
        sbqq__lineitemsprinted__c as is_line_items_printed,
        sbqq__orderbyquotelinegroup__c as is_order_by_quote_line_group,
        sbqq__ordered__c as is_ordered,
        sbqq__primary__c as is_primary,
        sbqq__uncalculated__c as is_uncalculated,
        sbqq__unopened__c as is_unopened,
        sbqq__watermarkshown__c as is_watermark_shown,
        show_additional_order_terms__c as is_show_additional_order_terms,
        subscription_term_check__c as is_subscription_term_check,
        hide_discounts_on_quote_template__c as is_hide_discounts_on_quote_template,
        show_sow__c as is_show_sow,
        show_discounts__c as is_show_discounts,
        requires_onboarding_approval__c as is_requires_onboarding_approval,
        no_onboarding_land__c as is_no_onboarding_land,


        additional_order_terms__c as additional_order_terms,
        annual_recurring_charges__c as annual_recurring_charges,
        approvalstatus__c as approval_status,
        ava_sfcpq__avataxmessage__c as ava_tax_message,
        ava_sfcpq__tax_calculation_status__c as tax_calculation_status,
        average_customer_discount_value__c as average_customer_discount_value,
        billing_frequency_check__c as billing_frequency_check,
        bill_to_email__c as bill_to_email,
        client_legal_entity__c as client_legal_entity,
        concurrent_run_slots__c as concurrent_run_slots,
        customer_legal_name__c as customer_legal_name,
        customer_po__c as customer_po,
        enterprise_agreement__c as enterprise_agreement,
        hours__c as hours,
        minor_versions__c as minor_versions,
        name,
        one_time_charge__c as one_time_charge,
        payment_terms_temp__c as payment_terms_temp,
        payment_term_days__c as payment_term_days,
        sbqq__additionaldiscountamount__c as additional_discount_amount,
        sbqq__averagecustomerdiscount__c as average_customer_discount,
        sbqq__averagepartnerdiscount__c as average_partner_discount,

        sbqq__billingcity__c as billing_city,
        sbqq__billingcountry__c as billing_country,
        sbqq__billingfrequency__c as billing_frequency,
        sbqq__billingname__c as billing_name,
        sbqq__billingpostalcode__c as billing_postal_code,
        sbqq__billingstate__c as billing_state,
        sbqq__billingstreet__c as billing_street,

        
        sbqq__contractingmethod__c as contracting_method,
        sbqq__customeramount__c as customer_amount,
        sbqq__daysquoteopen__c as days_quote_open,
        sbqq__lineitemcount__c as line_item_count,
        sbqq__listamount__c as list_amount,
        sbqq__netamount__c as net_amount,
        sbqq__papersize__c as paper_size,
        sbqq__paymentterms__c as payment_terms,
        sbqq__pricebook__c as price_book,
        sbqq__regularamount__c as regular_amount,
        sbqq__renewalterm__c as renewal_term,

        sbqq__shippingcity__c as shipping_city,
        sbqq__shippingcountry__c as shipping_country,
        sbqq__shippingname__c as shipping_name,
        sbqq__shippingpostalcode__c as shipping_postal_code,
        sbqq__shippingstate__c as shipping_state,
        sbqq__shippingstreet__c as shipping_street,
        
        sbqq__status__c as status,
        sbqq__subscriptionterm__c as subscription_term,
        sbqq__totalcustomerdiscountamount__c as total_customer_discount_amount,
        sbqq__type__c as type,
        signature_status__c as signature_status,
        amendment_quote__c as amendment_quote,
        --start_date_formatted__c as start_date_formatted,
        --expiration_date_formatted__c as expiration_date_formatted,
        --created_date_formatted__c as created_date_formatted,
        --end_date_formatted__c as end_date_formatted,
        --terms_signed_date_formatted__c,
        sbqq__customerdiscount__c as customer_discount,
        signature_version_word_doc_terms__c as signature_version_word_doc_terms,
        sbqq__source__c as source,
        template_terms_signed_by_legal_name__c as template_terms_signed_by_legal_name,
        terms_signed_by_legal_name__c as terms_signed_by_legal_name,
        annual_recurring_charges_override__c as annual_recurring_charges_override,
        template_annual_recurring_charges__c as template_annual_recurring_charges,
        onboarding_customer_total__c as onboarding_customer_total,
        onboarding_list_price__c as onboarding_list_price,
        onboarding__c as onboarding_discount_removal_reason,
        onboarding_discount_removal_details__c as onboarding_discount_removal_details,
        test_onboarding__c as test_onboarding,
        onboarding_discount__c as onboarding_discount,
    

        ----------  dates and timestamps
        createddate as created_at,
        to_date(createddate) as created_date,
        lastmodifieddate as last_modified_at,
        sbqq__startdate__c as start_at,
        sbqq__enddate__c as end_at,
        sbqq__expirationdate__c as expiration_at,
        sbqq__lastcalculatedon__c as last_calculated_at,
        sbqq__lastsavedon__c as last_saved_at,
        submitteddate__c as submitted_at,
        systemmodstamp,
        lastreferenceddate as last_referenced_at,
        lastvieweddate as last_viewed_at,
        terms_signed_date__c as terms_signed_at,
        

        _sdc_batched_at,
        _sdc_extracted_at,
        _sdc_received_at
        _sdc_sequence,
        _sdc_table_version
        

    from source

)

select * from renamed