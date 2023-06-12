with

source as (

      select * from raw.salesforce.task
),

renamed as (

    select
        id as salesforce_task_id,
        accountid as account_id,
        ownerid as owner_id,
        createdbyid as created_by_id,
        recordtypeid as record_type_id,

        whatid as what_id,
        whoid as who_id,
        whocount as who_count,
        whatcount as what_count,

        type as task_type,
        tasksubtype as task_subtype,

        calldisposition as call_disposition,
        calldurationinseconds as call_duration_in_s,
        calltype as call_type,

        priority,
        status,
        subject,
        contact_title__c as contact_title,
        work_on__c as work_on,
        deliver_on__c as deliver_on,
        description,
        sequence_name__c as sequence_name,
        sequence_step_number__c as sequence_step_number,

        duration__c as duration,
        gong__gong_selected_process__c as gong_selected_process,

    -- BOOLEANS
        isarchived as is_archived,
        isclosed as is_closed,
        isdeleted as is_deleted,
        ishighpriority as is_high_priority,
        isrecurrence as is_recurrence,
        isreminderset as is_reminder_set,

        mme__emaildate__c as mme_email_date,
        mme__emailfromaddress__c as mme_email_from_address,
        mme__emailfromname__c as mme_email_from_name,
        mme__type__c as mme_type,
        mme__emaildirection__c as mme_email_direction,

        email_direction__c as email_direction,

        case
            when mme__emaildirection__c = 'Sent' or email_direction__c = 'Outbound'
                then 'Outbound'
            when mme__emaildirection__c = 'Received' or email_direction__c = 'Inbound'
                then 'Inbound'
            else null
        end as combined_email_direction,



        lastmodifiedbyid as last_modified_by_id,
        lastmodifieddate as last_modified_at,
        reminderdatetime as reminder_at,
        createddate as created_at,
        activitydate as activity_date,
        completeddatetime as completed_at,
        systemmodstamp as system_modstamp

    from source

)

select * from renamed