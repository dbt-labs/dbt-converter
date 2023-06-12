with

source as (

      select * from raw.salesforce.event
),

renamed as (

    select
        id as salesforce_event_id,
        accountid as account_id,
        ownerid as owner_id,
        createdbyid as created_by_id,


        whatid as what_id,
        whoid as who_id,
        whocount as who_count,
        whatcount as what_count,
        showas as show_as,

        type as event_type,
        eventsubtype as event_subtype,
        groupeventtype as group_event_type,
        location,
        subject,
        description,

        gong__gong_selected_process__c as gong_selected_process,

    -- BOOLEANS
        isalldayevent as is_all_day_event,
        isarchived as is_archived,
        ischild as is_child,
        isdeleted as is_deleted,
        isgroupevent as is_group_event,
        isprivate as is_private,
        isrecurrence as is_recurrence,
        isrecurrence2 as is_recurrence2,
        isrecurrence2exception as is_recurrence2exception,
        isrecurrence2exclusion as is_recurrence2exclusion,
        isreminderset as is_reminder_set,

        startdatetime as start_at,
        enddatetime as end_at,
        enddate as end_date,
        durationinminutes as duration_in_min,
        reminderdatetime as reminder_at,

        lastmodifiedbyid as last_modified_by_id,
        lastmodifieddate as last_modified_at,

        createddate as created_at,
        activitydate as activity_date,
        activitydatetime as activity_at,
        systemmodstamp as system_modstamp

    from source

)

select * from renamed