{% set hand_raise_events = [
    "Contact Sales",
    "Support Request",
    "Contact Sales Email",
    "Email Introduction",
    "Community Introduction",
    "Partner - Existing Partner Customer",
    "Partner - Joint Coselling Opportunity",
    "dbt Cloud Enterprise sales referral"
] -%}

with

source as (

    select * from {{ source('salesforce', 'touchpoints') }}

),

renamed as (

    select

        -- identifiers
        id as touchpoint_id,
        account__c as account_id,
        campaign_id__c as campaign_id,
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
        impartnerprm_referral_status__c as impartner_prm_referral_status,
        message__c as message,
        name as touchpoint_name,
        source_detail__c as touchpoint_source_detail,
        source_type__c as touchpoint_source_type,
        source__c as touchpoint_source,
        status__c as touchpoint_status,
        archive_reason__c as archive_reason,
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
        row_number() over (partition by contact__c order by opened_at__c asc) as touchpoint_index,

        --to include a new hand raise event, add the touchpoint source to the hand_raise_events list at the top
        case
            when touchpoint_source in (
                {% for hand_raise_event in hand_raise_events -%}
                '{{hand_raise_event}}'
                {{ "," if not loop.last }}
                {%- endfor -%}) then true
            else false
        end as is_hand_raise_event,

        -- partners can register projects via Impartner and designate a
        -- dbt project as being 'dbt Core' or 'dbt Cloud'.
        -- this cleans up the Impartner data.
        case
            when touchpoint_source = 'dbt Project Registration Form'
                and message ilike '%Introduction of dbt Core%'
                    then 'dbt Core'

            when touchpoint_source = 'dbt Project Registration Form'
                and message ilike '%Introduction of dbt Cloud%'
                    then 'dbt Cloud'

            when touchpoint_source = 'dbt Project Registration Form'
                and message ilike '%Development support%'
                    then 'development support'

            when touchpoint_source = 'dbt Project Registration Form'
                and impartner_type_of_dbt_project in ('dbt Core', 'dbt Core project registration')
                    then 'dbt Core'
            when touchpoint_source = 'dbt Project Registration Form'
                and impartner_type_of_dbt_project in ('dbt Cloud', 'dbt Cloud Teams project registration')
                    then 'dbt Cloud'

        end as project_registration_type,


        -- booleans
        isdeleted as is_deleted,
        impartnerprm_isdealregistration__c as is_impartner_deal_registration,
        impartnerprm_dealregistrationdenied__c as is_impartner_deal_registration_denied,
        impartnerprm_notifypartner__c as is_impartner_notify_partner,
        qualified_touchpoint__c as is_qualified_touchpoint,

        -- timestamps
        createddate as created_at,
        closed_at__c as closed_at,
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