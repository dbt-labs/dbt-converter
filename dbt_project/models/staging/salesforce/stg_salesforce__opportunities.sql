with 

source as (

    select * from {{ source('salesforce', 'opportunity') }}

),

renamed as (

    select

        ----------  ids
        id as opportunity_id,
        accountid as account_id,
        createdbyid as created_by_id,
        lastmodifiedbyid as last_modified_by_id,
        ownerid as owner_id,
        technical_lead__c as technical_lead_id,
        partner2__c as partner_id,
        nurtured_from_opportunity__c as nurtured_opportunity_id,
        source_lead__c as touchpoint_id, -- this needs to be aliases until we fully transition
        opener__c as opener_id,
        dbt_labs_partner_manager__c as partner_manager_id,

        --We changed our partnership object in the past and bc of the change
        --Stitch created another field (previously partner__c) called
        --partner2__c which we should be using moving forward.

        pricebook2id as price_book_2_id,
        recordtypeid as record_type_id,


        case
            when accountid in {{ internal_sfdc_accounts_list() }}
                then true
            else false
        end as is_internal_account,

        name as opportunity_name,
        amount,
        stagename as stage_name,
        type as opportunity_type,
        current_term_opportunity__c as current_term_opportunity,
        description,
        fiscal__c as fiscal,
        fiscal_quarter__c as fiscal_quarter,
        fiscal_year__c as fiscal_year,
        forecastcategory as forecast_category,
        forecastcategoryname as forecast_category_name,
        hasopenactivity as has_open_activity,
        hasopportunitylineitem as has_opportunity_line_item,
        hasoverduetask as has_overdue_task,
        last_subscription_opportunity__c as last_subscription_opportunity,
        leadsource as lead_source,
        nextstep as next_step,
        probability / 100 as probability,
        services__c as services,
        source_lead__c as source_lead,
        status__c as status,
        term__c as term,
        territory_text_formula__c as territory,
        services_revenue_roll_up__c as services_revenue_roll_up,
        link_contract_start_to_close_date__c as link_contract_start_to_close_date,
        delta_customer__c as delta_customer,
        renewal_expansion_opportunity__c as renewal_expansion_opportunity,
        won_customer__c as won_customer,
        expected_delta_customer__c as expected_delta_customer,
        lead_source_calculated__c as lead_source_from_lead,
        lead_source_type__c as lead_source_type,
        cycle_time_days_since_discover__c as cycle_time_days_since_discover,
        region__c as region,
        opener_role__c as opener_role,
        sales_team__c as sales_team,

        detailed_lost_reason__c as detailed_lost_reason,
        lost_reason__c as lost_reason,
        lost_sub_reason__c as lost_sub_reason,
        current_data_transformation_tool__c as current_data_transformation_tool,
        alternatives_prospect_was_evaluating__c as alternatives_prospect_was_evaluating,
        business_case_overview_video__c as business_case_overview_video_url,
        opportunity_market_segment__c as opportunity_market_segment,
        use_case__c as opportunity_use_case,
        coalesce(p1_pricing_migration_tmp__c,false) as is_p1_migration_opportunity,
        out_of_compliance__c as is_out_of_compliance,

        ----------  arr
        end_arr_roll_up__c as end_arr_roll_up,
        won_arr__c as won_arr,
        end_arr__c as end_arr,
        expected_arr_delta__c as expected_arr_delta,
        delta_arr__c as delta_arr,
        starting_arr__c as starting_arr,
        discover_at_delta_arr__c as discover_at_delta_arr,

        ----------  final status info
        isclosed as is_closed,
        iswon as is_won,

        ----------  pov info
        pov__c as has_pov,
        estimated_pov_weeks__c as estimated_pov_weeks,
        technical_win__c as has_technical_win,
        pov_document_link__c as pov_document_link,
        demo_date__c as demo_at,
        pov_notes_summary__c as sa_next_steps,

        ----------  dates and timestamps
        createddate as created_at,
        createddate::date as created_date,

        closedate as close_at,
        closedate::date as close_date,
        contract_end__c::date as contract_end_date,
        contract_start__c::date as contract_start_date,

        to_date(pipeline_date__c) as pipeline_date,
        next_step_date__c::date as next_step_date,

        discover_date__c as discover_at,
        discover_date__c::date as discover_at_date,

        to_date(pov_start_date__c) as pov_started_at,
        to_date(pov_end_date__c) as pov_ended_at,

        dateadd(
            week,
            estimated_pov_weeks, 
            pov_started_at
        ) as pov_expected_end_date,

        case
            when is_won
                then close_date
        end as won_at,

        lastactivitydate as last_activity_at,
        lastmodifieddate as last_modified_at,
        lastvieweddate as last_viewed_at,
        last_reviewed_on__c as last_reviewed_on,
        lastreferenceddate as last_referenced_at,
        last_contacted_on__c as last_contacted_on,

        ---------- flag active and upcoming opportunities
        case 
            when close_date < current_date
            and contract_end_date >= current_date
            and stage_name = 'Closed Won'
                then true 
            else false 
        end as is_active,
           
        case 
            when contract_start_date > current_date()
                and contract_start_date < dateadd(day,90,current_date())
                then true
            else false 
        end as has_upcoming_start_date  -- is this contract starting within the next 90 days? 

    from source
    where isdeleted = false

)

select * from renamed
