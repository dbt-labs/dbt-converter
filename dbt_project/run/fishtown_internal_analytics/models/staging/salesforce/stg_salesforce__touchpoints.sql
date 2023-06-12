
  create or replace   view analytics_dev.dbt_jstein.stg_salesforce__touchpoints
  
   as (
    with

source as (

    select * from raw.salesforce.lead__c

),

renamed as (

    select

        -- identifiers
        id as touchpoint_id,
        account__c as account_id,
        contact__c as contact_id,
        createdbyid as created_by_id,
        dbt_cloud_account_user__c as cloud_user_account_mapping_id,
        dbt_cloud_account__c as cloud_account_mapping_id,
        dbt_cloud_user__c as cloud_user_mapping_id,
        impartnerprm_partneraccount__c as impartner_partner_account_id,
        --impartnerprm_partnercontact__c as impartner_partner_contact_id, -- this field doesn't yet exist, but it will soon
        lastmodifiedbyid as last_modified_by_id,
        opportunity__c as opportunity_id,
        ownerid as owner_id,
        referred_by_partner_contact__c as referred_by_partner_contact_id,
        referred_by_partner__c as referred_by_partner_id,
        zendesk_ticket__c as zendesk_ticket_id,
        external_touchpoint_id__c as external_touchpoint_id,
        
        -- dimensions
        dbt_cloud_account_user_relationship__c as cloud_user_account_relationship,
        impartnerprm_dealregistrationstatus__c as impartner_deal_registration_status,
        impartnerprm_type_of_dbt_project__c as impartner_type_of_dbt_project,
        impartnerprm_type_of_registration__c as impartner_type_of_registration,
        message__c as message,
        name as touchpoint_name,
        source_detail__c as touchpoint_source_detail,
        source_type__c as touchpoint_source_type,
        source__c as touchpoint_source,
        status__c as touchpoint_status,
        touchpoint_group__c as touchpoint_group,
        channel__c as channel,
        channel_grouping__c as channel_grouping,
        data_source__c as data_source,
        utm_medium__c as utm_medium,
        utm_source__c as utm_source,
        utm_campaign__c as utm_campaign,
        sub_channel__c as sub_channel,
        bucket_mapping__c as source_type,
        team__c as team,

        -- booleans
        isdeleted as is_deleted,
        impartnerprm_isdealregistration__c as is_impartner_deal_registration,
        impartnerprm_dealregistrationdenied__c as is_impartner_deal_registration_denied,
        impartnerprm_notifypartner__c as is_impartner_notify_partner,
        qualified_touchpoint__c as is_qualified_touchpoint,

        -- timestamps
        createddate as created_at,
        lastactivitydate as last_activity_at,
        lastmodifieddate as last_modified_at,
        lastvieweddate as last_viewed_at,
        lastreferenceddate as last_referenced_at,
        opened_at__c as opened_at,
        qualified_at__c as qualified_at,
        systemmodstamp as system_modstamp

    from source

)

select * from renamed
  );

