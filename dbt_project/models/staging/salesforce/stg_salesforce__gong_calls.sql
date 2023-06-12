with source as (

    select * from {{ source('salesforce', 'gong_call') }}

),

renamed as (

    select
        id as gong_call_id,
        gong__call_id__c as call_id,
        createdbyid as created_by_id,
        ownerid as owner_id,
        lastmodifiedbyid as last_modified_by_id,
        gong__primary_account__c::varchar as primary_account_id,
        gong__primary_opportunity__c::varchar as primary_opportunity_id,
        gong__primary_user__c as primary_user_id,

        name::varchar as call_name,
        gong__call_start__c as call_start_at,
        gong__call_end__c as call_end_at,
        gong__call_duration_sec__c as call_duration_sec,
        gong__call_duration__c as call_duration,

        gong__direction__c as direction,
        gong__gong_count__c as gong_count,
        gong__language__c as language,
        gong__media__c as media,

        gong__opportunity_stage_now__c as opportunity_stage_now,
        gong__opp_amount_time_of_call__c as opp_amount_time_of_call,
        gong__opp_close_date_time_of_call__c as opp_close_date_time_of_call,
        gong__opp_probability_time_of_call__c as opp_probability_time_of_call,
        gong__opp_stage_time_of_call__c as opp_stage_time_of_call,
        gong__participants_emails__c as participants_emails,
        gong__pricing_duration__c as pricing_duration,

        gong__related_accounts_json__c as related_accounts_json,
        gong__related_agenda_json__c as related_agenda_json,
        gong__related_contacts_json__c as related_contacts_json,
        gong__related_leads_json__c as related_leads_json,
        gong__related_opportunities_json__c as related_opportunities_json,
        gong__related_participants_json__c as related_participants_json,
        gong__related_scorecards_json__c as related_scorecards_json,
        gong__related_stats_json__c as related_stats_json,
        gong__related_topics_json__c as related_topics_json,
        gong__related_trackers_json__c as related_trackers_json,

        gong__scheduled__c as scheduled,
        gong__scope__c as scope,
        gong__system__c as system,
        gong__title__c as title,
        gong__view_call__c as view_call,
        gong__opp_forecast_category_time_of_call__c as opp_forecast_category_time_of_call,

        isdeleted as is_deleted,
        lastmodifieddate as last_modified_date,
        lastreferenceddate as last_referenced_date,
        lastvieweddate as last_viewed_date,

        systemmodstamp as system_modstamp,
        createddate as created_at

    from source

)

select * from renamed