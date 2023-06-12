with 

source as (

    select * from raw.salesforce.lead__c

),

renamed as (

    select

        ----------  ids
        id as lead_id,
        account__c as account_id,
        opportunity__c as opportunity_id,
        ownerid as owner_id,
        createdbyid as created_by_id,
        referred_by_partner__c as referred_by_partner_id,
        contact__c as contact_id,
        lastmodifiedbyid as last_modified_id,

        name as lead_name,
        row_number() over (partition by contact__c order by opened_at__c asc) as lead_index,
        source__c as lead_source,
        source_type__c as lead_source_type,
        status__c as lead_status,
        message__c as message,
        archive_reason_detail__c as archive_reason_detail,
        archive_reason__c as archive_reason,
        source_detail__c as source_detail,
        dbt_cloud_account_user_relationship__c as cloud_user_account_relationship,

        case
            when source__c = 'dbt Project Registration Form'
            and message ilike '%Introduction of dbt Core%'
                then 'dbt Core'
            when source__c = 'dbt Project Registration Form'
            and message ilike '%Introduction of dbt Cloud%'
                then 'dbt Cloud'
            when source__c = 'dbt Project Registration Form'
            and message ilike '%Development support%'
                then 'development support'

            when source__c = 'dbt Project Registration Form'
            and impartnerprm_type_of_dbt_project__c in ('dbt Core', 'dbt Core project registration')
                then 'dbt Core'
            when source__c = 'dbt Project Registration Form'
            and impartnerprm_type_of_dbt_project__c in ('dbt Cloud', 'dbt Cloud Teams project registration')
                then 'dbt Cloud'          
            -- Partners now can register projects via Impartner and designate a
            -- dbt project as being 'dbt Core' or 'dbt Cloud'. This cleans up the 
            -- Impartner data. 
        end as project_registration_type,
        impartnerprm_referral_status__c as impartner_prm_referral_status,

        isdeleted as is_deleted,

        case
            when account__c in 

(
    '0016g00000EFCncAAH', -- Fishtown Analytics
    '0014v00002OxoX7AAJ', -- dbt Labs
    '0014v00002Id1ZEAAZ' -- James's Test Account
)


                then true
            else false
        end as is_internal_account,

        -- the below is temporary logic to parse HREs within leads
        -- this will soon be deprecated when we completely move to touchpoints
        -- you'll notice this is the same logic we are using in `fct_touchpoints` today
        case
            when source__c in (
                'Contact Sales'
                ,'Support Request'
                ,'Contact Sales Email'
                ,'Email Introduction'
                ,'Community Introduction'
                ,'Partner - Existing Partner Customer'
                ,'Partner - Joint Coselling Opportunity'
                ,'dbt Cloud Enterprise sales referral'
                ) then true 
            else false
        end as is_hand_raise_event,

        closed_at__c as closed_at,
        createddate as created_at,
        to_date(createddate) as created_date,
        lastmodifieddate as last_modified_at,
        lastreferenceddate as last_referenced_at,
        lastvieweddate as last_viewed_at,
        opened_at__c as opened_at,
        systemmodstamp as system_modstamp,
        to_date(last_contacted__c) as last_contacted_date,

        _sdc_batched_at,
        _sdc_extracted_at,
        _sdc_received_at,
        _sdc_sequence,
        _sdc_table_version

    from source

)

select * from renamed