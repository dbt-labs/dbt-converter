with

source as (

    select * from {{ source('salesforce', 'contact') }}

),

region_lookup as (

    select * from {{ ref('country_to_region_mappings') }}

),

unique_regions as (

    select distinct
        country_code,
        region_category
    
    from region_lookup

),

renamed as (

    select

        --identifiers
        id as contact_id,
        ownerid as owner_id,
        accountid as account_id,
        createdbyid as created_by_id,
        sdr__c as sdr_id,
        reportstoid as reports_to_id,
        current_sequence_user_integration_id__c as current_sequence_owner_id,
        impartnerprm_primary_contact__c as impartner_primary_contact_id,
        qualified_touchpoint__c as qualified_touchpoint_id,
        zendesk_user_id__c as zendesk_user_id,
        lid__session_id__c as lid__session_id,
        outreach_initial_sequence_id__c as initial_sequence_id,
        outreach_current_sequence_id__c as current_sequence_id,
        account_id_from_domain__c as account_id_from_domain,
        lastmodifiedbyid as last_modified_by_id,
        domain__c as domain_id,

        case
            when accountid in {{ internal_sfdc_accounts_list() }}
                then true
            else false
        end as is_internal_account,

        --contact information
        archive_reason__c as archive_reason,
        description,
        email,
        name,
        firstname as first_name,
        lastname as last_name,
        lower(title) as title,
        salutation,
        phone,
        photourl as photo_url,
        linkedin__c as linkedin,
        type__c as account_type,
        contact_status__c as contact_status,
        created_reason__c as created_reason,
        leadsource as lead_source,
        how_did_you_hear_about_us__c as how_did_you_hear_about_us,
        mailingcity as city,
        mailingcountry as country,
        mailingcountrycode as country_code,
        mailingpostalcode as postal_code,
        mailingstate as state,
        mailingstatecode as state_code,
        mailingstreet as street,
        unique_regions.region_category,

        --clearbit firmographics
        role__c as role,
        sub_role__c as sub_role,
        seniority__c as seniority,

        --cloud
        most_recent_dbt_cloud_billing_plan__c as most_recent_cloud_billing_plan,
        most_recent_lead_sign_up_billing_plan__c as most_recent_touchpoint_cloud_billing_plan,
    
        --mmerp (Match My Email Activity Reports)
        mmerp__lastdirection__c as mmerp__lastdirection,
        mmerp__lastsubject__c as mmerp__lastsubject,
        mmerp__firstsubjectrecv__c as mmerp__firstsubjectrecv,
        mmerp__firstfromsent__c as mmerp__firstfromsent,
        mmerp__responsegap__c as mmerp__responsegap,
        mmerp__lastfrom__c as mmerp__lastfrom,
        mmerp__lastsubjectrecv__c as mmerp__lastsubjectrecv,
        mmerp__lastfromrecv__c as mmerp__lastfromrecv,
        mmerp__firstdirection__c as mmerp__firstdirection,
        mmerp__firstsubject__c as mmerp__firstsubject,
        mmerp__firstfrom__c as mmerp__firstfrom,
        mmerp__lastfromsent__c as mmerp__lastfromsent,
        mmerp__lastsubjectsent__c as mmerp__lastsubjectsent,
        mmerp__firstsubjectsent__c as mmerp__firstsubjectsent,
        mmerp__firstfromrecv__c as mmerp__firstfromrecv,

        -- outreach
        outreach_current_sequence_name__c as current_sequence_name,
        outreach_current_sequence_step_number__c as current_sequence_step_number,
        outreach_current_sequence_step_type__c as current_sequence_step_type,
        
        outreach_finished_sequences__c as finished_sequences,
        outreach_initial_sequence_name__c as initial_sequence_name,
        outreach_sequence_to_add_to__c as sequence_to_add_to,
        current_sequence_user_name__c as current_sequence_owner,

        --touchpoints
        most_recent_lead_source__c as most_recent_touchpoint_source,
        most_recent_lead_status__c as most_recent_touchpoint_status,

        --booleans
        isdeleted as is_deleted,
        isemailbounced as is_email_bounced,
        domain_is_consumer_domain__c as is_consumer_domain,
        outreach_actively_being_sequenced__c as is_actively_being_sequenced,
        domain_matches_account_primary_domain__c as matches_primary_account_domain,
        hasoptedoutofemail as has_opted_out_of_email,
        account_matches_domain_account__c as account_matches_domain_account,
        toggle_to_sync_to_zendesk__c as is_synced_to_zendesk,
        champifyio__no_longer_at_company__c as is_no_longer_at_company,
        
        --measures
        total_emails_outreach__c as total_emails_outreach,
        mmerp__total__c as mmerp__total_emails,
        total_emails__c as total_emails,
        total_recv_emails_outreach__c as total_recv_emails_outreach,
        mmerp__totalrecv__c as mmerp__totalrecv,
        total_recv_emails__c as total_recv_emails,
        total_sent_emails_outreach__c as total_sent_emails_outreach,
        mmerp__totalsent__c as mmerp__totalsent,
        total_sent_emails__c as total_sent_emails,
        outreach_number_of_active_sequences__c as number_of_active_sequences,
        outreach_number_of_active_tasks__c as number_of_active_tasks,
        of_touchpoints_all_time__c as count_of_touchpoints_all_time,
        touchpoints_l90__c as count_of_90d_touchpoints,

        --contact timestamps
        createddate as contact_created_at,
        
        lastactivitydate as last_activity_date,        
        lastmodifieddate as last_modified_date,
        lastreferenceddate as last_referenced_date,
        lastvieweddate as last_viewed_date,
        
        --touchpoint timestamps
        promoted_at__c as promoted_at,
        qualified_at__c as qualified_at,
        most_recent_dbt_cloud_sign_up_date__c as most_recent_cloud_sign_up_at,
        most_recent_lead_sign_up_date__c as most_recent_touchpoint_cloud_sign_up_at,

        --sequence timestamps
        outreach_current_sequence_task_due_date__c as current_sequence_task_due_at,
        outreach_date_added_to_sequence__c as added_to_current_sequence_at,
        initial_sequence_date__c as initial_sequence_at,

        --email timestamps
        first_email__c as first_email_at,
        last_email__c as last_email_at,
        first_recv_email__c as first_recv_email_at,
        first_recv_email_outreach__c as first_recv_email_outreach_at,
        first_sent_email_outreach__c as first_sent_email_outreach_at,
        last_recv_email_outreach__c as last_recv_email_outreach_at,
        first_email_outreach__c as first_email_outreach_at,
        last_sent_email_outreach__c as last_sent_email_outreach_at,
        last_email_outreach__c as last_email_outreach_at,
        last_sent_email__c as last_sent_email,
        last_recv_email__c as last_recv_email,
        first_sent_email__c as first_sent_email,
        mmerp__firstdatetimesent__c as mmerp__firstdatetimesent_at,
        mmerp__firstdatetimerecv__c as mmerp__firstdatetimerecv_at,
        mmerp__lastdatetimesent__c as mmerp__lastdatetimesent_at,
        mmerp__lastdatetimerecv__c as mmerp__lastdatetimerecv_at,
        mmerp__firstdatetime__c as mmerp__firstdatetime_at,
        mmerp__lastdatetime__c as mmerp__lastdatetime_at,

        --champify timestamps
        champifyio__job_change_detected_date__c as champify__job_change_detected_at,
        champifyio__champify_job_started_date__c as champify__job_started_at,

        systemmodstamp as system_modstamp

    from source
    left join unique_regions
        on source.mailingcountrycode = unique_regions.country_code
        
)

select * from renamed